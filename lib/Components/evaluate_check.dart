import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostCheck extends StatefulWidget {
  final String url;
  final String title;
  final String detail;
  final int emotion;
  final int physical;
  final int cultural;
  final int positive;
  final int blue;
  final String date;
  final String place;

  const PostCheck({
    required this.url,
    required this.title,
    required this.detail,
    required this.emotion,
    required this.physical,
    required this.cultural,
    required this.positive,
    required this.blue,
    required this.date,
    required this.place,
  });

  @override
  CheckPostState createState() => CheckPostState();
}
class CheckPostState extends State<PostCheck> {
  @override
  Widget build(BuildContext context) {
     return Container(
      decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
                  boxShadow: [
      BoxShadow(
                            color: Colors.grey, //色
                    spreadRadius: 5, 
                    blurRadius: 5, 
                    offset: Offset(1, 1),
      ),
    ],
            ),

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
                  height:500,
                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      widget.url,
                      fit: BoxFit.cover, // Adjust this based on your image requirements
                                   errorBuilder: (c, o, s) {
                return const Icon(
                  Icons.error,
                  color: Colors.red,
                );
              },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite, color: Colors.red, size: 30),
                    const SizedBox(width: 10),
                    Icon(Icons.map, color: Colors.blue, size: 30),
                    const SizedBox(width: 10),
                    Icon(Icons.sentiment_satisfied, color: Colors.yellow, size: 30),
                    const SizedBox(width: 10),
                    Icon(Icons.link, color: Colors.green, size: 30),
                    const SizedBox(width: 10),
                    Icon(Icons.favorite, color: Colors.blue, size: 30),
                    const SizedBox(width: 15),
                    Icon(Icons.add_location, color: Colors.black, size: 30),
                    const SizedBox(width: 5),
                    Container(
                      child: Text(widget.place),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.detail,
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  child: Text(
                    DateFormat('MMMM dd, yyyy hh:mm a').format(DateTime.parse(widget.date)),
                    style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}