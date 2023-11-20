import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/bar_bottom.dart';
import 'package:nokosu2023/Components/bar_top.dart';
import 'package:nokosu2023/Components/loading_overlay.dart';
import 'package:nokosu2023/providers/home_state.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/utils/global_vars.dart';
import 'package:nokosu2023/utils/static_functions.dart';
import 'package:provider/provider.dart';
import 'package:nokosu2023/Components/folder_component.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({Key? key}) : super(key: key);

  @override
  _FolderScreenState createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: ThemeColours.bgBlueWhite,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.125,
            child: Container(),
          ),
          TopBar(camkey: GlobalKey(), middleIcon: const SizedBox()),
          const BottomBar(),
          if (Global.isLoading) const LoadingOverlay(),
          Center(
            child: FolderComponent(folderName: 'My Documents'), // 任意のフォルダ名を指定
          ),
        ],
      ),
    );
  }
}