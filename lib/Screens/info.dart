import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/SubComponents/error_field.dart';
import 'package:nokosu2023/Components/button_link.dart';
import 'package:nokosu2023/Components/button_submit.dart';
import 'package:nokosu2023/Components/dropdown_l10n.dart';
import 'package:nokosu2023/Components/input_field.dart';
import 'package:nokosu2023/Components/loading_overlay.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nokosu2023/models/models.dart';

class Infos extends StatefulWidget {
  const Infos({Key? key}) : super(key: key);

  @override
  State<Infos> createState() => _InfosState();
}



class _InfosState extends State<Infos> {

  List<Info> infolist =[];


/* ここで、見せれるポストがない時を表示するかも
  void login() {
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
*/
  void redirectRegistration() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegistrationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // タイトルを非表示にする
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            ButtonLink(
              textLabel: locale.newuser,
              textLink: locale.registerhere,
              onPressed: redirectRegistration,
            ),
            const DropdownL10n()
          ],
        ),
      ),
    );
  }
}