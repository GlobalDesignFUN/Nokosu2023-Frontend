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

class FolderComponent extends StatelessWidget {
  final String folderName;

  const FolderComponent({Key? key, required this.folderName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.folder,
            size: 40,
            color: Colors.blue,
          ),
          SizedBox(height: 10),
          Text(
            folderName,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}