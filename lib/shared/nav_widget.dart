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
      backgroundColor: Palette.background,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: height * 0.105,
          decoration: const BoxDecoration(
            color: Palette.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 0.5,
                color: Colors.transparent,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Palette.primary,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                height: height * 0.085,
                width: width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    navIcon(CupertinoIcons.phone, 0),
                    navIcon(CupertinoIcons.chat_bubble, 1),
                    navIcon(CupertinoIcons.person, 2),
                  ],
                ),
              ),
              Container(
                height: 1,
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
      icon: Icon(icon, size: 30.0),
      color: _selectedIndex == index
          ? const Color.fromARGB(255, 231, 176, 184)
          : Palette.background,
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
