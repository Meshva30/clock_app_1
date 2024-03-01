import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  Stopwatch stopwatch = Stopwatch();
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 30), Time);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'Stopwatch',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bb.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 280,
                      width: 370,
                      decoration: BoxDecoration(
                        //color: Colors.black54,
                        shape: BoxShape.circle,
                        //borderRadius: BorderRadius.all(Radius.circular(80)),
                        border: Border.all(color: Colors.black, width: 3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            formatTime(stopwatch.elapsed),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (stopwatch.isRunning) {
                            stopwatch.stop();
                          } else {
                            stopwatch.start();
                          }
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.black; // Color when button is disabled
                            }
                            return Colors.white; // Color when button is enabled
                          },
                        ),
                      ),
                      child: Text(stopwatch.isRunning ? 'Stop' : 'Start',
                          style: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          stopwatch.reset();
                        });
                      },
                      child: Text('Reset'),),
                  ],

                ),


            ],
            ),
          ),
        ),
      ),
    );
  }

  void Time(Timer timer) {
    if (stopwatch.isRunning) {
      setState(() {});
    }
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes);
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    String milliseconds = twoDigits((duration.inMilliseconds % 1000) ~/ 10);
    return '$minutes:$seconds.$milliseconds';
  }
}
