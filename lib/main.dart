
// ignore: file_names
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<ApiResults> res;
  @override
  void initState() {
    super.initState();
    res = fetchApiResults();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APIをPOSTで呼び出しJSONパラメータを渡す',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Api JSON Post Sample'),
        ),
        body: Center(
          child: FutureBuilder<ApiResults>(
            future: res,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.data.toString(),
                    style: TextStyle(
    fontSize: 50 ,
  ),
                  //.message.toString() 
                  );
              } else  if (snapshot.connectionState != ConnectionState.done) {
              return CircularProgressIndicator();
            }
              else if (snapshot.hasError) {
                
                return Text(snapshot.error.toString());
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class ApiResults {
  final String token;
  final String profile;

  ApiResults({
    required this.token,
    required this.profile,
  });
  factory ApiResults.fromJson(Map<String, dynamic> json) {

    return ApiResults(
      token: json['token'],
      profile: json['profile'],
    );
  }
    @override
  String toString() {
    return 'ApiResults(token: $token)';
  }
}

Future<ApiResults> fetchApiResults() async {
  //ログインapiのurlをＵＲｉ　の型にする
  var url = Uri.parse("https://globaldesign2023backend.onrender.com/api/users/login/");
  //SampleRequestで、送るデータの型を決める
  //型に合わせて実際に送るデータを決める
  var request = SampleRequest(username: "yoshiki", password: 'ewrjioiojio234');
  //データを送る
  //successしたとき　responseにデータが入る
  //failureしたとき　エラーメッセージが入る
  final response = await http.post(url,
      body: json.encode(request.toJson()),
      headers: {"Content-Type": "application/json",
      "User-Agent":"PostmanRuntime/7.34.0",
      'Accept': 'application/json',
      });
  if (response.statusCode == 200) {
    return ApiResults.fromJson(json.decode(response.body));
    
  } else {
    throw Exception('Failed');
  }
}
class SampleRequest {
  String username;
  String password;
  SampleRequest({
    required this.username,
    required this.password,
  });
  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
  };
}
