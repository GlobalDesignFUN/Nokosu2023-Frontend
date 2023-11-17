import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/SubComponents/error_field.dart';
import 'package:nokosu2023/Components/button_link.dart';
import 'package:nokosu2023/Components/button_submit.dart';
import 'package:nokosu2023/Components/dropdown_l10n.dart';
import 'package:nokosu2023/Components/input_field.dart';
import 'package:nokosu2023/Components/loading_overlay.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nokosu2023/api/api.dart';
import 'package:nokosu2023/models/models.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/utils/global_vars.dart';
import 'package:nokosu2023/utils/static_functions.dart';
import 'package:nokosu2023/Components/SubComponents/neumorphism.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FolderPage extends StatefulWidget {
  const FolderPage({Key? key}) : super(key: key);

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  bool isBookIconSelected = true;

  @override
  Widget build(BuildContext context) {
    double squareSize = MediaQuery.of(context).size.width / 20;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColours.bgBlueWhite,
        title: Row(
          children: [
            // 本のアイコン
            GestureDetector(
              onTap: () {
                // 本のアイコンがタップされたときの処理
                setState(() {
                  isBookIconSelected = true;
                });
              },
              child: Icon(
                Icons.book,
                color: isBookIconSelected
                    ? const Color.fromARGB(255, 0, 30, 75)
                    : Colors.black,
              ),
            ),
            SizedBox(width: 8), // アイコンとタイトルの間にスペースを追加
            Spacer(), // アイコンと右側の余白の間を広げる

            // 人のアイコン
            GestureDetector(
              onTap: () {
                // 人のアイコンがタップされたときの処理
                setState(() {
                  isBookIconSelected = false;
                });
              },
              child: Icon(
                Icons.person,
                color: isBookIconSelected
                    ? Colors.black
                    : const Color.fromARGB(255, 0, 30, 75),
              ),
            ),
          ],
        ),
        centerTitle: true, // タイトルを中央に配置
      ),
      body: Column(
        children: [
          AppBar(
            backgroundColor: ThemeColours.bgBlueWhite,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 0, 30, 75)), // 左向きの矢印を追加
              onPressed: () {
                // 左向きの矢印がタップされたときの処理
              },
            ),
            title: Center(
              child: Text(
                'Global Design',
                style: TextStyle(color: const Color.fromARGB(255, 0, 30, 75)), // 四角形の色
              ),
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: GridView.builder(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 8) {
                      return Container();
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: squareSize,
                          height: squareSize,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isBookIconSelected
                                  ? const Color.fromARGB(255, 0, 30, 75)
                                  : Colors.black,
                            ),
                          ),
                          child: Icon(
                            Icons.folder,
                            color: isBookIconSelected
                                ? const Color.fromARGB(255, 0, 30, 75)
                                : Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Album ${index + 1}',
                          style: TextStyle(color: Colors.black),
                        ),
                        Spacer(),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
