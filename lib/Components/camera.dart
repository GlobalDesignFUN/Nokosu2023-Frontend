import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/loading_overlay.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:permission_handler/permission_handler.dart';

class Camera extends StatefulWidget {
  final double width;
  final double height;

  const Camera({
    Key? key,
    this.width = 0,
    this.height = 0,
  }) : super(key: key);

  @override
  CameraState createState() => CameraState();
}

class CameraState extends State<Camera> {
  late List<CameraDescription> cameras;
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final int _camIndex = 0;
  bool _isCamAvailable = false;
  int _isFlashOn = 0;
  //double _scale = 1.0;
  // double zoom = 1.0;
  // late double minZoom;
  // late double maxZoom;

  Future<void> initializeCamera(int indx) async {
    WidgetsFlutterBinding.ensureInitialized();

    while (!await Permission.camera.request().isGranted) {
      await Permission.location.request();
    }
    while (!await Permission.location.request().isGranted) {
      await Permission.location.request();
    }
    while (!await Permission.storage.request().isGranted) {
      await Permission.location.request();
    }

    cameras = await availableCameras();
    late CameraDescription camera;
    if (indx > cameras.length) {
      camera = cameras.first;
    } else {
      camera = cameras[indx];
    }

    _controller = CameraController(
      camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  Future<int> toggleFlash() async {
    try {
      if (_isFlashOn == 0) {
        await _controller.setFlashMode(FlashMode.auto);
        setState(() {
          _isFlashOn = 1;
        });
        return 1;
      } else if (_isFlashOn == 1) {
        await _controller.setFlashMode(FlashMode.torch);
        setState(() {
          _isFlashOn = 2;
        });
        return 2;
      } else {
        await _controller.setFlashMode(FlashMode.off);
        setState(() {
          _isFlashOn = 0;
        });
        return 0;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return 0;
    }
  }

  Future<XFile> takePic() async {
    XFile image = await _controller.takePicture();
    return image;
  }

  @override
  void initState() {
    super.initState();
    initializeCamera(_camIndex).then((_) async {
      _isCamAvailable = true;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.725;
    if (_isCamAvailable) {
      return FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              color: ThemeColours.bgBlueWhite,
              width: width,
              height: height,
              child: GestureDetector(
                // onScaleStart: (details) async {
                //   minZoom = await _controller.getMinZoomLevel();
                //   maxZoom = await _controller.getMaxZoomLevel();
                //   zoom = _scale;
                // },
                // onScaleUpdate: (details) {
                //   _scale = (zoom * details.scale).clamp(minZoom, maxZoom);
                // },
                // onScaleEnd: (details) {
                //   _controller.setZoomLevel(_scale);
                // },
                child: ClipRect(
                  child: OverflowBox(
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: SizedBox(
                        width: 1,
                        height: _controller.value.aspectRatio,
                        child: CameraPreview(_controller),
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return LoadingOverlay(
              width: width,
              height: height,
            );
          }
        },
      );
    } else {
      return LoadingOverlay(
        width: width,
        height: height,
      );
    }
  }
}
