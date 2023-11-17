import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geolocator/geolocator.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;
  final ImagePicker _imagePicker = ImagePicker();
  final TextEditingController _commentController = TextEditingController();

  Future<void> getImage() async {
    final XFile? pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    _updateImage(pickedFile);
  }

  void _updateImage(XFile? pickedFile) {
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<String> _getLocation() async {
    Position position = await _determinePosition();
    List<geocoding.Placemark> placemarks = await geocoding.placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    geocoding.Placemark placemark = placemarks[0];
    return placemark.name ?? 'Unknown Location';
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
    } 

    return await Geolocator.getCurrentPosition();
  }

  void _showPopup(String buttonText) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Popup for $buttonText'),
          content: buttonText == 'Write a comment'
              ? TextField(
                  controller: _commentController,
                  decoration: InputDecoration(labelText: 'Enter your comment'),
                )
              : (buttonText == 'Where was this photo taken?'
                  ? FutureBuilder(
                      future: _getLocation(),
                      builder: (context, AsyncSnapshot<String> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return Text('Location: ${snapshot.data}');
                        }
                      },
                    )
                  : Text('This is a popup for $buttonText.')),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(100, 40),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(
                    _image!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
          ),
          SizedBox(height: 16),
          Column(
            children: [
              ElevatedButton(
                onPressed: () => _showPopup('Display'),
                child: Text('Display'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(100, 40),
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _showPopup('Write a comment'),
                child: Text('Write a comment'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(100, 40),
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _showPopup('Where was this photo taken?'),
                child: Text('Where was this photo taken?'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(100, 40),
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _showPopup('Select group'),
                child: Text('Select group'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(100, 40),
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  _showPopup('Next');
                  print(_commentController.text);
                },
                child: Text('Next'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(100, 40),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image from Gallery',
        child: Icon(Icons.image),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
