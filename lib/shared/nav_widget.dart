import 'package:chat_app/screens/calls_screen.dart';
import 'package:chat_app/screens/home/home_page.dart';
import 'package:chat_app/screens/profile_screen.dart';
import 'package:chat_app/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavSection extends StatefulWidget {
  const NavSection({
    super.key,
  });

  @override
  State<NavSection> createState() => _NavSectionState();
}

class _NavSectionState extends State<NavSection> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const CallsScreen(),
     HomePage(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _pages[_selectedIndex],
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: height * 0.105,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 10,
                color: Colors.transparent,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Palette.primary,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                height: height * 0.06,
                width: width * 0.72,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    navIcon(CupertinoIcons.group, 0),
                    navIcon(CupertinoIcons.add_circled, 1),
                    navIcon(CupertinoIcons.square_on_circle, 2),
                  ],
                ),
              ),
              Container(
                height: 10,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget navIcon(IconData icon, int index) {
    return IconButton(
      icon: Icon(icon, size: 26.0),
      color: _selectedIndex == index
          ? const Color.fromARGB(255, 28, 12, 248)
          : const Color.fromARGB(255, 102, 101, 101),
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
