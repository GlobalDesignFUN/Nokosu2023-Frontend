import 'package:flutter/material.dart';

class ButtonNavbar3 extends StatefulWidget {
  final String text1;
  final String text2;
  final String text3;
  
  final Function onTap;

  const ButtonNavbar3({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
   
    required this.onTap,
  }) : super(key: key);

  @override
  _ButtonNavbar3State createState() => _ButtonNavbar3State();
}

class _ButtonNavbar3State extends State<ButtonNavbar3> {
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
            icon: Icon(Icons.explore),
            label: 'Folder',
            tooltip: "tooltip1",
          ),
          NavigationDestination(
            icon: Icon(Icons.commute),
            label: 'Camera',
            tooltip: "tooltip2",
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_border),
            label: 'Video',
            tooltip: "tooltip3",
            selectedIcon: Icon(Icons.bookmark),
          ),
          
        ],
      ),
      body: _pages[_currentPageIndex],
    );
  }
}
