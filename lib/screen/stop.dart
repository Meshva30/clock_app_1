import 'dart:async';

import 'package:flutter/material.dart';

class stopwatch extends StatefulWidget {
  const stopwatch({super.key});

  @override
  State<stopwatch> createState() => _stopwatchState();
}


class _stopwatchState extends State<stopwatch> {
  bool isRunning = false;
  late Timer _timer;
  late Stopwatch _stopwatch;
  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void StartStop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    } else {
      _stopwatch.start();
    }
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Color(0xff121212),
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
      body: Container(
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
                    decoration: const BoxDecoration(
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
                      Center(child: Text( formatTime(_stopwatch.elapsedMilliseconds),style: TextStyle(color: Colors.white,fontSize: 25),)),
                    ),
                  ),
                ),

              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: ()
                  {
                    setState(() {
                      _stopwatch.start();
                    });
                  },
                  child: Icon(Icons.play_arrow,color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: ()
                  {
                    setState(() {
                      _stopwatch.stop();
                    });
                  },
                  child: Icon(Icons.stop,color: Colors.black,),
                ),
                ElevatedButton(
                  onPressed: ()
                  {
                    setState(() {
                      _stopwatch.reset();
                    });
                  },
                  child: Icon(Icons.restart_alt,color: Colors.black,),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
int start = 0;
String formatTime(int second) {

  var secs = second ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');
  return "$hours:$minutes:$seconds";
}

String format(int seconds) {
  var milli = (seconds % 1000).toString().padLeft(3, '0');
  return milli;
}
