import 'package:flutter/material.dart';

class ButtonNavbar extends StatefulWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final Function onTap;

  const ButtonNavbar({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.onTap,
  }) : super(key: key);

  @override
  _ButtonNavbarState createState() => _ButtonNavbarState();
}

class _ButtonNavbarState extends State<ButtonNavbar> {
  void initState() {
    super.initState();
  }

  var _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: Text(widget.text1), // widgetを使って外部クラスのプロパティにアクセス
      ),
      Container(
        color: Colors.green,
        alignment: Alignment.center,
        child: Text(widget.text2),
      ),
      Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text(widget.text3),
      ),
      Container(
        color: Colors.yellow,
        alignment: Alignment.center,
        child: Text(widget.text4),
      ),
    ];

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        selectedIndex: _currentPageIndex,
        animationDuration: const Duration(seconds: 10),
        elevation: 10,
        height: 100,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.perm_media),
            label: 'Folder',
            tooltip: "tooltip1",
          ),
          NavigationDestination(
            icon: Icon(Icons.photo_camera),
            label: 'Camera',
            tooltip: "tooltip2",
          ),
          NavigationDestination(
            icon: Icon(Icons.video_call),
            label: 'Video',
            tooltip: "tooltip3",
            selectedIcon: Icon(Icons.bookmark),
          ),
          NavigationDestination(
            icon: Icon(Icons.account_box),
            label: 'Profile',
            tooltip: "tooltip4",
          ),
        ],
      ),
      body: _pages[_currentPageIndex],
    );
  }
}
