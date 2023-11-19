import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/evaluate_check.dart';
import 'package:intl/intl.dart';
class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body:Center( 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          PostCheck(
            url : "",
            title: "Hello",
            detail: "hello",
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
              child: Text('Next ideas'),
            ),
        ],
      ),
        ),
      );
  }
}