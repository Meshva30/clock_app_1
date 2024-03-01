import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

DateTime dateTime = DateTime.now();

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "Analog App",
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
        centerTitle: true,
        elevation: 2,
        shadowColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/b1.jpg"),fit: BoxFit.fill,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Center(
              child: Container(
                height: 290,
                width: 290,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/clock.jpg"),fit: BoxFit.cover
                  ),
                  border: Border.all(width: 2,color: Colors.grey),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff1B2731),
                      blurRadius: 15,
                      spreadRadius: 5,

                    ),
                  ],

                ),
                child: Stack(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    // ...List.generate(
                    //   60,
                    //   (index) => Transform.rotate(
                    //     angle: index * 6 * pi / 180,
                    //     child: Center(
                    //       child: Divider(
                    //
                    //         thickness: (index % 5 == 0) ? 5 : 4,
                    //         indent: (index % 5 == 0) ? 265:280,
                    //         endIndent: 0,
                    //         color:
                    //             (index % 5 == 0) ? Colors.indigo : Colors.grey,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Center(
                      child: Transform.rotate(
                        angle: dateTime.second * 6 * pi / 180,
                        child: VerticalDivider(
                          color: Colors.blue,
                          thickness: 3,
                          indent: 30,
                          endIndent: 110,
                        ),
                      ),
                    ),
                    Center(
                      child: Transform.rotate(
                        angle: dateTime.minute * 6 * pi / 180,
                        child: VerticalDivider(
                          color: Colors.blue,
                          thickness: 5,
                          indent: 50,
                          endIndent: 110,
                        ),
                      ),
                    ),
                    Center(
                      child: Transform.rotate(
                        angle: (dateTime.hour % 12 + dateTime.minute / 60) * 30 * pi / 180,
                        child: VerticalDivider(
                          color: Colors.black,
                          thickness: 8,
                          indent: 100,
                          endIndent: 130,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "${dateTime.hour % 12}:${dateTime.minute}:${dateTime.second}",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 60, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}