import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/button_link.dart';
import 'package:nokosu2023/Components/button_submit.dart';
import 'package:nokosu2023/Components/dropdown_l10n.dart';
import 'package:nokosu2023/Components/input_field.dart';
import 'package:nokosu2023/Components/popup_info.dart';
import 'package:nokosu2023/Screens/registration.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart';//httpリクエストのパッケージ
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // To get the password and username values
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late AppLocalizations locale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    locale = AppLocalizations.of(context)!;
  }

  void login() {
    Future <void> getData() async{
     // var response = await htt
    }



    showDialog(
      context: context,
      builder: (context) {
        return PopupInfo(
          title: 'Login Details',
          info:
              'Username is ${usernameController.text}\nPassword is ${passwordController.text}',
        );
      },
    );
  }

  void redirectRegistration() {//画面切り替え
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegistrationPage()),//RegistrationPageに移動
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // タイトルを非表示にする
      body: Center(//センター寄せ
        child: Column(//縦にする
          mainAxisAlignment: MainAxisAlignment.center,//多分センター寄せ
          children: <Widget>[//子供の要素が
            InputField(//入力エリア
              label: locale.username,//ラベルをユーザーネームにする
              controller: usernameController,//TextEdittingControllerにする
              ispasswordField: false,
            ),
            InputField(
              label: locale.password,//ラベル
              controller: passwordController,//
              ispasswordField: true,
            ),
            ButtonSubmit(
              text: locale.login,//テキストをログインにする
              onPressed: login,//上のログイン関数を呼び出す
            ),
            ButtonLink(//登録画面に移動する
              textLabel: locale.newuser,
              textLink: locale.registerhere,
              onPressed: redirectRegistration,
            ),
            const DropdownL10n()//ドロップダウンリストを出す
          ],
        ),
      ),
    );
  }
}
