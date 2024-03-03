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
        const Duration(seconds: 1),
            (timer) {
          setState(() {
            dateTime = DateTime.now();
          });
        }
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Stop Watch',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.indigo.shade800,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,

                ),
                child: Icon(Icons.settings,size: 20,)),
          ),
        ],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/b1.jpg", fit: BoxFit.cover),
          ),
          Center(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.white,fontSize: 55,fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: '${dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12} : ${dateTime.minute} : ${dateTime.second}',
                  ),
                  TextSpan(
                    text: ' ${dateTime.hour < 12 ? 'AM' : 'PM'}',
                    style: const TextStyle(fontSize: 20),
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