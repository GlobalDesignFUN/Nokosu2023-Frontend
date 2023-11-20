import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/evaluate_check.dart';
import 'package:intl/intl.dart';
import 'package:nokosu2023/utils/constants.dart';
class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: ThemeColours.bgBlueWhite,
      body:Center( 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          PostCheck(
            url : "https://pbs.twimg.com/media/EVQegDJUEAE2039.jpg",
            
            title: "Hello",
            detail: "hello",
            place: "hello",
            emotion:1,
            physical: 0, 
            cultural: 1,
            positive: 1,
            blue: 0,
            date: DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now()),
          ),

      
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your button click logic here
                
              },
               style: ElevatedButton.styleFrom(
    primary: Colors.white, // 背景色を白に設定
    onPrimary: Colors.black, // テキストの色を黒に設定
  ),
              child: Text('Next ideas'),
            ),
        ],
      ),
        ),
      );
  }
}