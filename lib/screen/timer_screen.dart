import 'dart:async';


import 'package:flutter/material.dart';

import 'analog.dart';

class Timer_clock extends StatefulWidget {
  const Timer_clock({super.key});

  @override
  State<Timer_clock> createState() => _Timer_clockState();
}


class _Timer_clockState extends State<Timer_clock> {

  @override
  Widget build(BuildContext context)
  {

    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        title: Text('Timer Clock',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.indigo.shade800,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,

                ),
                child: Icon(Icons.settings,size: 20,)),
          ),
        ],
        centerTitle: true,
      ),
      body:
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/b1.jpg"),fit: BoxFit.fill,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff424242),
                        boxShadow: [
                          BoxShadow(color: Colors.white,blurRadius: 5),
                        ]
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(
                    child: Container(
                      height: 220,
                      width: 220,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff181818),
                          boxShadow: [
                            BoxShadow(color: Colors.grey,blurRadius: 2),
                          ]
                      ),
                      child:
                      Center(child: Text('00 : 00 : 00',style: TextStyle(color: Colors.white,fontSize: 25),)),
                    ),
                  ),
                ),

              ],
            ),
            Spacer(),
            Padding(
              padding:  EdgeInsets.only(bottom: 10),
              child: Expanded(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(color: Colors.white,blurRadius: 5),
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.play_arrow,color: Colors.white,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}