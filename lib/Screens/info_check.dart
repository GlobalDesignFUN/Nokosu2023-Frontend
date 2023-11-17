import 'package:flutter/material.dart';

class ThemeColours {
  static const Color bgBlueWhite = Color(0xFFABCDEF); // Replace with your desired color code
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColours.bgBlueWhite,
      body:Center( 
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(
              width: 400,
              height: 655,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 350,
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset("images/a.png"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.favorite, color: Colors.red, size: 30),
                      const SizedBox(width: 10),
                      const Icon(Icons.map, color: Colors.blue, size: 30),
                      const SizedBox(width: 10),
                      const Icon(Icons.sentiment_satisfied, color: Colors.yellow, size: 30),
                      const SizedBox(width: 10),
                      const Icon(Icons.link, color: Colors.green, size: 30),
                      const SizedBox(width: 10),
                      const Icon(Icons.favorite, color: Colors.blue, size: 30),
                      const SizedBox(width: 15),
                      const Icon(Icons.add_location, color: Colors.black, size: 30),
                      const SizedBox(width: 5),
                      Container(
                        child: const Text("My friend's house"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: const Text(
                          "この写真は友達の家のキッチンです",
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: const Text(
                          "全体的に清潔感があり、過ごしやすく感じる。",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    child: const Text(
                      "September 29, 2023 PM 6:21",
                      style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your button click logic here
                print('Button Clicked');
              },
              child: Text('Your Button'),
            ),
          ],
        ),
      ),
      )
    );
  }
}
void main() {
//runAppでウィジェットツリーのルートを指定とウィジェットをスクリーンに反映
//MatrialAppでウィジェット作る
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nokosu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "The First"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Page1());
  }
}