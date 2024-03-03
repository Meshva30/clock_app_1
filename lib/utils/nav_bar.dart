
import 'package:clock_app/screen/analog.dart';
import 'package:clock_app/screen/digital.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../screen/stop.dart';
import '../screen/timer_screen.dart';


class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[

    home_screen(),
    Homescreen(),
    Timerapp(),
    stopwatch(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 90,
          width: 200,
          child: ClipRRect(
            child: GNav(
              backgroundColor: Color(0xff121212),
              tabBorderRadius: 20,
              rippleColor: Colors.grey[500]!,
              hoverColor: Colors.grey[100]!,
              gap: 10,
              activeColor: Colors.black,
              iconSize: 27,
              haptic: true,
              padding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              duration: const Duration(milliseconds: 200),
              tabBackgroundColor: Colors.grey[200]!,
              color: Colors.white,
              style: GnavStyle.google,
              tabs: const [
                GButton(
                  icon: Icons.watch_later_outlined,
                  text: 'Analog',
                ),
                GButton(
                  icon: Icons.watch,
                  text: 'Digital Clock',
                ),
                GButton(
                  icon: CupertinoIcons.timer,
                  text: 'Timer clock',
                ),
                GButton(
                  icon: CupertinoIcons.stopwatch,
                  text: 'Stop watch',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
