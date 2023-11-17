import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nokosu2023/Components/bar_bottom.dart';
import 'package:nokosu2023/Components/camera.dart';
import 'package:nokosu2023/Components/bar_top.dart';
import 'package:nokosu2023/Components/loading_overlay.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/utils/global_vars.dart';
import 'package:nokosu2023/utils/static_functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<CameraState> cameraKey = GlobalKey();
  final picker = ImagePicker();
  late XFile image;
  int flashMode = 0;
  int nextFlashMode = 1;

  @override
  void initState() {
    Global.isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: ThemeColours.bgBlueWhite,
      body: Stack(
        children: [
          Positioned(
              top: MediaQuery.of(context).size.height * 0.125,
              child: Camera(key: cameraKey)),
          TopBar(
            w1: IconButton(
              icon: Icon(Icons.bookmarks_outlined),
              onPressed: () {
                RedirectFunctions.redirectTutorial(context);
              },
            ),
            w2: IconButton(
              icon: Icon(flashMode == 1
                  ? Icons.flash_auto
                  : flashMode == 2
                      ? Icons.flash_on
                      : Icons.flash_off),
              onPressed: () async {
                final cameraState = cameraKey.currentState;

                if (cameraState != null) {
                  flashMode = await cameraState.setFlash(nextFlashMode);
                  nextFlashMode = flashMode == 0
                      ? 1
                      : flashMode == 1
                          ? 2
                          : 0;
                  setState(() {});
                }
              },
            ),
            w3: IconButton(
              icon: const Icon(Icons.person_outline),
              onPressed: () {},
            ),
          ),
          BottomBar(
            w1: IconButton(
              icon: const Icon(Icons.photo_library_outlined),
              onPressed: () async {
                image = (await picker.pickImage(source: ImageSource.gallery))!;
                // ignore: use_build_context_synchronously
                RedirectFunctions.redirectInfo(
                    context, Image.file(File(image.path)));
              },
            ),
            w2: IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {
                RedirectFunctions.redirectHome(context);
              },
            ),
            w3: IconButton(
              icon: const Icon(Icons.supervisor_account_outlined),
              onPressed: () {},
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.15 - 40,
            left: MediaQuery.of(context).size.width / 2 - 40,
            child: SizedBox(
              width: 80,
              height: 80,
              child: Container(
                decoration: BoxDecoration(
                  color: ThemeColours.bgBlueWhite,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    width: 0,
                    color: Colors.transparent,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      offset: const Offset(6, 6),
                      color: ThemeColours.shadowDark.withOpacity(0.3),
                    )
                  ],
                ),
                child: IconButton(
                  onPressed: () async {
                    setState(() {
                      Global.isLoading = true;
                    });

                    final cameraState = cameraKey.currentState;
                    if (cameraState != null) {
                      flashMode = await cameraState.setFlash(0);
                      nextFlashMode = 1;
                      image = await cameraState.takePic();

                      // ignore: use_build_context_synchronously
                      RedirectFunctions.redirectInfo(
                          context, Image.file(File(image.path)));
                    }

                    setState(() {
                      Global.isLoading = false;
                    });
                  },
                  icon: const Icon(Icons.add_circle_outline_rounded),
                ),
              ),
            ),
          ),
          if (Global.isLoading) const LoadingOverlay(),
        ],
      ),
    );
  }
}
