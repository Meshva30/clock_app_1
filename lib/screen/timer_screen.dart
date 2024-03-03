import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const Timerapp());
}

class Timerapp extends StatefulWidget {
  const Timerapp({Key? key}) : super(key: key);

  @override
  State<Timerapp> createState() => _TimerappState();
}

DateTime dateTime = DateTime.now();

int click = 0;

class _TimerappState extends State<Timerapp> {
  int minutes = 1;
  late int second = (minutes * 60);
  bool isRunning = false;
  late Timer timer;

  void startStop() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (isRunning && second > 0) {
          second--;
        } else {
          timer.cancel();
          isRunning = false;
          second = minutes * 60;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int hour = dateTime.hour % 12;
    hour = (hour == 0) ? 12 : hour;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade800,
        centerTitle: true,
        title: Text(
          'Timer',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        actionsIconTheme: const IconThemeData(color: Colors.white),
        actions: [Icon(Icons.settings)],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/b1.jpg"),
          fit: BoxFit.fill,
        )),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(70),
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                color: Color(0xFF0A0A0A),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey,width: 3)
              ),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      '$second sec',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  if (isRunning) {
                    isRunning = false;
                    timer.cancel();
                  } else {
                    isRunning = true;
                    startStop();
                  }
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(

                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),

                  ),
                  Text(
                    '5 minutes',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Text(
                    '15 minutes',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isRunning = true;
                });
              },
              child: Text('Start Timer'),
            ),

            // this is bottom nav bar
          ],
        ),
      ),
    );
  }
}
