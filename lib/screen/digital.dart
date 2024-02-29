import 'dart:async';

import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

DateTime dateTime = DateTime.now();

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(
        Duration(seconds: 1),
            (timer) {
          setState(() {
            dateTime = DateTime.now();
          });
        }
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2C3246),
        title: Text("Digital App",
            style: TextStyle(
                fontWeight: FontWeight.bold,color: Colors.white
            )),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/bg1.gif", fit: BoxFit.cover),
          ),
          Center(
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.white,fontSize: 55,fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: '${dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12} : ${dateTime.minute} : ${dateTime.second}',
                  ),
                  TextSpan(
                    text: ' ${dateTime.hour < 12 ? 'AM' : 'PM'}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}