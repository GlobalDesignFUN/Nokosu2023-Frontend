import 'package:flutter/material.dart';
import 'screens/login2.dart';
//import 'package:login_ui/views/auth_page/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //title: 'Nokosu',
      home: LoginPage(),
    );
  }
}
