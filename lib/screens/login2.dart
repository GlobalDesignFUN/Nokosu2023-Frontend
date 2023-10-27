import 'package:flutter/material.dart';
import 'package:nokosu2023/components/button_1.dart';
import 'package:nokosu2023/components/input_1.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  void loginPressed() {
    print('ログインボタンがクリックされました');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // タイトルを非表示にする
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/nokosu_logo.png'), // スクリーンショット画像を表示
            SizedBox(height: 20),
            input_1(label: 'User name'),
            SizedBox(height: 20), // 間隔を挿入
            input_1(label: 'Email'),
            SizedBox(height: 20), // 間隔を挿入
            input_1(label: 'password'),
            SizedBox(height: 20), // 間隔を挿入
            input_1(label: 'password confirm'),
            SizedBox(height: 20), // 間隔を挿入
            button_1(text: 'アカウント登録', onPressed: loginPressed),
          ],
        ),
      ),
    );
  }
}
