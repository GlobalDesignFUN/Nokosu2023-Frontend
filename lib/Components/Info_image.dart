import 'package:flutter/material.dart';
import 'package:nokosu2023/providers/locale_provider.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:provider/provider.dart';


class Info extends StatefulWidget{
  final int? id;
  final String? topic;
  final String? description;
  final DateTime? created;
  final String? photo;
  final String? url;
  final int? group;
  final int? createdBy;
  final bool? positive;
  final bool? emotion;
  final bool? cultural;
  final bool? physical;
  final String? location;
  final double? latitude;
  final double? longitude;
  final String? address;

  const Info({
    required this.id,
    required this.topic,
    required this.description,
    required this.created,
    this.photo,
    this.url,
    this.group,
    required this.createdBy,
    required this.positive,
    required this.emotion,
    required this.cultural,
    required this.physical,
    this.location,
    this.latitude,
    this.longitude,
    this.address,
  });


  @override
  InfoState createState() => InfoState();
}

class InfoState extends State<Info>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(             
             widget.url!,
              fit: BoxFit.cover, // Adjust the fit as needed
              height: 200, // Set the height as needed
              width: double.infinity, // Take the full width),
          )


      ],)

    );
  }

}



