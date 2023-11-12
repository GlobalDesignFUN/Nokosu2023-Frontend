import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nokosu2023/models/models.dart';
import 'package:nokosu2023/providers/form_err_res_provider.dart';
import 'package:nokosu2023/providers/profile_provider.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/providers/token_provider.dart';
import 'package:provider/provider.dart';

//return 0 成功
//return 1 失敗
//return 2 通信エラー

void _setProfile(context, json) {
  Provider.of<TokenProvider>(context, listen: false)
      .setToken(json['token'], json['profile']['id']);
  Provider.of<ProfileProvider>(context, listen: false)
      .setModel(Profile.fromJson(json['profile']));
}



Future<int> apiLogin(context, UserLogin data) async {
  try {
    final response = await http.post(
      Uri.parse('${APILinks.base}users/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data.toJson()),
    );

    if (response.statusCode == 200) {
      _setProfile(context, jsonDecode(response.body));
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      return 2;
    }
  } catch (e) {
    if (kDebugMode) {
      print("Exception : $e");
    }
    return 2;
  }
}

//＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
//check please  apiLogOut
//******************************************************************* */
Future<int> apiLogOut(context) async {
  try {
    final response = await http.post(
      Uri.parse('${APILinks.base}users/logout/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {

      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      return 2;
    }
  } catch (e) {
    if (kDebugMode) {
      print("Exception : $e");
    }
    return 2;
  }
}

Future<int> apiRegister(context, UserReg data) async {
  try {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${APILinks.base}users/register/'));
    // request.files.add(await http.MultipartFile.fromPath('file', 'path/to/file'));
    data.toJson().forEach((key, value) {
      request.fields[key] = value.toString();
    });
    final response = await request.send();
    if (response.statusCode == 200) {
      _setProfile(context, jsonDecode(await response.stream.bytesToString()));
      return 0;
    } else if (response.statusCode == 400) {
      UserRegResponse userres = UserRegResponse.fromJson(
          jsonDecode(await response.stream.bytesToString()));
      Provider.of<FormErrProvider>(context, listen: false).setModel(userres);
      return 1;
    } else {
      return 2;
    }
  } catch (e) {
    if (kDebugMode) {
      print("Exception : $e");
    }
    return 2;
  }
}


// ignore: non_constant_identifier_names
Future<int> PasswordReset(context, UserLogin data) async {
  try {
    final response = await http.post(
      Uri.parse('${APILinks.base}password_reset/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data.toJson()),
    );

    if (response.statusCode == 200) {
      _setProfile(context, jsonDecode(response.body));
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      return 2;
    }
  } catch (e) {
    if (kDebugMode) {
      print("Exception : $e");
    }
    return 2;
  }
}

// ignore: non_constant_identifier_names
Future<int> PasswordResetConfirm(context, UserLogin data) async {
  try {
    final response = await http.post(
      Uri.parse('${APILinks.base}password_reset/confirm/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data.toJson()),
    );

    if (response.statusCode == 200) {
      _setProfile(context, jsonDecode(response.body));
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      return 2;
    }
  } catch (e) {
    if (kDebugMode) {
      print("Exception : $e");
    }
    return 2;
  }
}




Future<int> GetProfile(context, UserLogin data) async {
  try {
    final response = await http.get(
      Uri.parse('${APILinks.base}profiles/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },

    );


    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      // Profileオブジェクトのリストに変換
      List<Profile> profileList = jsonList.map((json) => Profile.fromJson(json)).toList();

      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      return 2;
    }
  } catch (e) {
    if (kDebugMode) {
      print("Exception : $e");
    }
    return 2;
  }
}

// ignore: non_constant_identifier_names
Future<int> GetOneProfile(context, UserLogin data) async {
  try {
    final response = await http.get(
      Uri.parse('${APILinks.base}profiles/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },

    );


    if (response.statusCode == 200) {

      // Profileオブジェクトのリストに変換
      Profile profile  = jsonDecode(response.body);
      
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      return 2;
    }
  } catch (e) {
    if (kDebugMode) {
      print("Exception : $e");
    }
    return 2;
  }
}

// ignore: non_constant_identifier_names
Future<int> UpdateProfile(context, UserLogin data) async {
  try {
    final response = await http.put(
      Uri.parse('${APILinks.base}profiles/5/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data.toJson()),

    );

    if (response.statusCode == 200) {
      _setProfile(context, jsonDecode(response.body));
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      return 2;
    }
  } catch (e) {
    if (kDebugMode) {
      print("Exception : $e");
    }
    return 2;
  }
}

// ignore: non_constant_identifier_names
Future<int> DeleteProfile(context, UserLogin data) async {
  try {
    final response = await http.delete(
      Uri.parse('${APILinks.base}profiles/5/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },


    );

    if (response.statusCode == 200) {


      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      return 2;
    }
  } catch (e) {
    if (kDebugMode) {
      print("Exception : $e");
    }
    return 2;
  }
}

//maybe token is missiing
// ignore: non_constant_identifier_names
Future<int> GetAllInfos(context, UserLogin data) async {
  try {
    final response = await http.get(
      Uri.parse('${APILinks.base}infos/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },

    );


    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      // Profileオブジェクトのリストに変換
      List<Info> InfoList = jsonList.map((json) => Info.fromJson(json)).toList();
      
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      return 2;
    }
  } catch (e) {
    if (kDebugMode) {
      print("Exception : $e");
    }
    return 2;
  }
}

//maybe token is missiing
// ignore: non_constant_identifier_names
Future<int> GetOneInfos(context, UserLogin data) async {
  try {
    final response = await http.get(
      Uri.parse('${APILinks.base}infos/1/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },

    );


    if (response.statusCode == 200) {
      // Profileオブジェクトのリストに変換
      Info profileList = Info.fromJson(jsonDecode(response.body));
      
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      return 2;
    }
  } catch (e) {
    if (kDebugMode) {
      print("Exception : $e");
    }
    return 2;
  }
}




// ignore: non_constant_identifier_names
Future<int> PostInfo(context, Info data) async {
  try {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${APILinks.base}infos/'));
    // request.files.add(await http.MultipartFile.fromPath('file', 'path/to/file'));
    data.toJson().forEach((key, value) {
      request.fields[key] = value.toString();
    });
    final response = await request.send();
    if (response.statusCode == 200) {
      _setProfile(context, jsonDecode(await response.stream.bytesToString()));
      return 0;
    } else if (response.statusCode == 400) {

      return 1;
    } else {
      return 2;
    }
  } catch (e) {
    if (kDebugMode) {
      print("Exception : $e");
    }
    return 2;
  }
}


// ignore: non_constant_identifier_names
Future<int> UpdateInfo(context, Info data) async {
  try {
    final response = await http.put(
      Uri.parse('${APILinks.base}profiles/5/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data.toJson()),

    );

    if (response.statusCode == 200) {
      _setProfile(context, jsonDecode(response.body));
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      return 2;
    }
  } catch (e) {
    if (kDebugMode) {
      print("Exception : $e");
    }
    return 2;
  }
}


// ignore: non_constant_identifier_names
Future<int> DeleteInfo(context, Info data) async {
  try {
    final response = await http.delete(
      Uri.parse('${APILinks.base}infos/1/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },

    );

    if (response.statusCode == 200) {
      _setProfile(context, jsonDecode(response.body));
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      return 2;
    }
  } catch (e) {
    if (kDebugMode) {
      print("Exception : $e");
    }
    return 2;
  }
}


