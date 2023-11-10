import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

Future<void> main() async {
  // main 関数内で非同期処理を呼び出すための設定
  WidgetsFlutterBinding.ensureInitialized();
  // デバイスで使用可能なカメラを全て取得
  final cameras = await availableCameras();
  runApp(SampleApp(camera: cameras.first));
}

class SampleApp extends StatelessWidget {
  const SampleApp({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Camera(camera: camera),
    );
  }
}

// カメラ画面
class Camera extends StatefulWidget {
  const Camera({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.max);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
        body: CameraPreview(_controller),
        floatingActionButton: FloatingActionButton(
          child: GestureDetector(
            // タップした時
            onTap: () async {
              // 写真撮影
              final image = await _controller.takePicture();
              // 表示用の画面に遷移
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ImagePreview(imagePath: image.path),
                  fullscreenDialog: true,
                ),
              );
            },
            // 長押しを開始した時
            onLongPress: () async {
              // 動画撮影開始
              await _controller.startVideoRecording();
            },
            // 長押しを終了した時
            onLongPressUp: () async {
              // 動画撮影終了
              final video = await _controller.stopVideoRecording();
              // 表示用の画面に遷移
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => VideoPreview(videoPath: video.path),
                  fullscreenDialog: true,
                ),
              );
            },
            child: const Icon(Icons.add_a_photo),
          ),
          onPressed: () {},
        ));
  }
}

// 撮影した写真を表示する画面
class ImagePreview extends StatelessWidget {
  const ImagePreview({Key? key, required this.imagePath}) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preview')),
      body: Center(child: Image.file(File(imagePath))),
    );
  }
}

// 撮影した動画を表示する画面
class VideoPreview extends StatefulWidget {
  const VideoPreview({
    Key? key,
    required this.videoPath,
  }) : super(key: key);

  final String videoPath;

  @override
  _VideoPreviewState createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath));
    _controller.initialize().then((_) {
      setState(() {});
      _controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Preview')),
      body: Center(
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}