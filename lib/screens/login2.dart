import 'package:flutter/material.dart';
import 'package:nokosu2023/components/button_1.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  void loginPressed(){
    print('ログインボタンがクリックされました')
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
            Container(
              width: 200, // TextFormFieldの幅を狭くする
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                  labelText: 'User name',
                  labelStyle: TextStyle(
                    color: const Color.fromARGB(255, 243, 187, 33),
                    decoration: TextDecoration.none,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20), // 間隔を挿入
            Container(
              width: 200, // TextFormFieldの幅を狭くする
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                  labelText: 'Email',
                  labelStyle:
                      TextStyle(color: const Color.fromARGB(255, 243, 184, 33)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(
                            255, 243, 142, 33)), // ボーダーの色を指定
                  ),
                ),
              ),
            ),

            SizedBox(height: 20), // 間隔を挿入
            Container(
              width: 200, // TextFormFieldの幅を狭くする
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                  labelText: 'password',
                  labelStyle:
                      TextStyle(color: const Color.fromARGB(255, 243, 184, 33)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(
                            255, 243, 142, 33)), // ボーダーの色を指定
                  ),
                ),
              ),
            ),

            SizedBox(height: 20), // 間隔を挿入
            Container(
              width: 200, // TextFormFieldの幅を狭くする
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                  labelText: 'password',
                  labelStyle:
                      TextStyle(color: const Color.fromARGB(255, 243, 184, 33)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(
                            255, 243, 142, 33)), // ボーダーの色を指定
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // 間隔を挿入
            button_1(text: 'アカウント登録'  , onPressed: loginPressed)
          ],
        ),
      ),
    );
  }
}
