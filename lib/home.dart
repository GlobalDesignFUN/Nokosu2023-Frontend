import 'package:flutter/material.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String displayText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('nokosu'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2, // 2列
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  displayText = 'Take a photo';
                });
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(20, 20), // ボタンのサイズを設定
              ),
              child: Text('Take a photo'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  displayText = 'Photo file';
                });
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(20, 20),
              ),
              child: Text('Photo file'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  displayText = 'Photo folder';
                });
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(20, 20),
              ),
              child: Text('Photo folder'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  displayText = 'Tutorial';
                });
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(20, 20),
              ),
              child: Text('Tutorial'),
            ),
            //SizedBox: (20,20),
            Text(
              displayText,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
