import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nokosu2023/models/models.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/providers/token_provider.dart';

Future<dynamic> apiLogin(UserLogin data) async {
  try {
    final response = await http.post(
      Uri.parse('${APILinks.base}users/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data.toJson()),
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      TokenProvider.setToken(json['token'], json['profile']['id']);
      return Profile.fromJson(json['profile']);
    } else if (response.statusCode == 400) {
      return "1";
    } else {
      return "2";
    }
  } catch (e) {
    if (kDebugMode) {
      print("Exception : $e");
    }
    return "2";
  }
}

Future<dynamic> apiRegister(UserReg data) async {
  try {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${APILinks.base}users/register/'));
    // request.files.add(await http.MultipartFile.fromPath('file', 'path/to/file'));
    data.toJson().forEach((key, value) {
      request.fields[key] = value.toString();
    });
    final response = await request.send();
    if (response.statusCode == 200) {
      var json = jsonDecode(await response.stream.bytesToString());
      TokenProvider.setToken(json['token'], json['profile']['id']);
      return Profile.fromJson(json['profile']);
    } else if (response.statusCode == 400) {
      return UserRegResponse.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      return "2";
    }
  } catch (e) {
    if (kDebugMode) {
      print("Exception : $e");
    }
    return "2";
  }
}
