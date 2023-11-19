import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/SubComponents/error_field.dart';
import 'package:nokosu2023/Components/SubComponents/neumorphism.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nokosu2023/Components/button_flip.dart';
import 'package:nokosu2023/Components/loading_overlay.dart';
import 'package:nokosu2023/api/api.dart';
import 'package:nokosu2023/models/models.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/utils/static_functions.dart';

class Categories extends StatefulWidget {
  final Info info;
  final String imagePath;
  const Categories({
    Key? key,
    required this.info,
    required this.imagePath,
  }) : super(key: key);

  @override
  CategoriesState createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {
  TextEditingController errorController = TextEditingController();

  bool positive = false;
  bool cultural = false;
  bool physical = false;
  bool emotional = false;

  bool isLoading = false;

  late AppLocalizations locale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    locale = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 540,
            child: Neumo(
              onlyBlackShaodw: true,
              border: 10,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  ButtonFlip(
                    textLabelYes: locale.positive,
                    textLabelNo: locale.negative,
                    iconYes: CustIcons.positive,
                    iconNo: CustIcons.negative,
                    onButtonPressed: (value) {
                      setState(() {
                        positive = value;
                      });
                    },
                  ),
                  const SizedBox(height: 40),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      locale.selcats,
                      style: const TextStyle(
                        color: ThemeColours.txtBlack,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ButtonFlip(
                    textLabelYes: locale.emo,
                    textLabelNo: locale.noemo,
                    iconYes: CustIcons.emo,
                    iconNo: CustIcons.noemo,
                    onButtonPressed: (value) {
                      setState(() {
                        emotional = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ButtonFlip(
                    textLabelYes: locale.phys,
                    textLabelNo: locale.nophys,
                    iconYes: CustIcons.phys,
                    iconNo: CustIcons.nophys,
                    onButtonPressed: (value) {
                      setState(() {
                        physical = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ButtonFlip(
                    textLabelYes: locale.cult,
                    textLabelNo: locale.nocult,
                    iconYes: CustIcons.cult,
                    iconNo: CustIcons.nocult,
                    onButtonPressed: (value) {
                      setState(() {
                        cultural = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ErrorField(err: errorController.text),
                  Material(
                    child: SizedBox(
                      width: 200,
                      height: 60,
                      child: Neumo(
                        color: ThemeColours.doneBtn,
                        child: InkWell(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              locale.done,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: ThemeColours.txtWhite,
                              ),
                            ),
                          ),
                          onTap: () async {
                            setState(() {
                              isLoading = true;
                            });
                            widget.info.positive = positive;
                            widget.info.cultural = cultural;
                            widget.info.physical = physical;
                            widget.info.emotion = emotional;
                            int err = await apiAddInfo(
                                context, widget.info, widget.imagePath);
                            if (err != 0) errorController.text = locale.errcrs;
                            setState(() {
                              isLoading = false;
                            });
                            if (err == 0) {
                              errorController.text = '';
                              // ignore: use_build_context_synchronously
                              RedirectFunctions.redirectHome(context);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      if (isLoading) const LoadingOverlay(),
    ]);
  }
}