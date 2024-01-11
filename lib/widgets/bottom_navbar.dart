import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_application/blocs/home-bloc.dart';
import 'package:flutter_demo_application/blocs/home-states.dart';

class BottomNavbar extends StatefulWidget {
  int currentIndex = 0;

  BottomNavbar({required this.currentIndex});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return BottomNavigationBar(
    //   elevation: 0,
    //   backgroundColor: Colors.black,
    //   fixedColor: Colors.black,
    //   items: const <BottomNavigationBarItem>[
    //     BottomNavigationBarItem(
    //       activeIcon: Icon(Icons.home),
    //       icon: Icon(
    //         Icons.home_outlined,
    //         color: Colors.white,
    //       ),
    //       label: 'Home',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(
    //         Icons.search_outlined,
    //         color: Color.fromARGB(255, 187, 185, 185),
    //       ),
    //       label: 'Search',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(
    //         Icons.library_music_sharp,
    //         color: Color.fromARGB(255, 187, 185, 185),
    //       ),
    //       label: 'My Library',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: ImageIcon(
    //         AssetImage('lib/assets/images/1217164_spotify_icon.png'),
    //         color: Color.fromARGB(255, 187, 185, 185),
    //       ),
    //       label: 'premium',
    //     ),
    //   ],
    //   currentIndex: widget.currentIndex,
    //   // selectedItemColor: Colors.amber[800],
    //   onTap: (int index) {
    //     if (index == 0) {
    //       Navigator.pushReplacementNamed(context, "/home");
    //       // Navigator.pushNamed(context, '/home');
    //     } else if (index == 1) {
    //       Navigator.pushReplacementNamed(context, "/search");
    //       // Navigator.pushNamed(context, '/search');
    //     }
    //   },
    // );

    return NavigationBar(
        backgroundColor: Colors.black.withOpacity(0.1),
        onDestinationSelected: (int index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, "/home");
            // Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, "/search");
            // Navigator.pushNamed(context, '/search');
          }
        },
        indicatorColor: Colors.transparent,
        selectedIndex: widget.currentIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.home_outlined,
              color: Color.fromARGB(255, 156, 154, 154),
            ),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.search_outlined,
              color: Color.fromARGB(255, 187, 185, 185),
            ),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.library_music_sharp,
              color: Color.fromARGB(255, 187, 185, 185),
            ),
            label: 'My library',
          ),
          NavigationDestination(
            icon: ImageIcon(
              AssetImage('lib/assets/images/1217164_spotify_icon.png'),
              color: Color.fromARGB(255, 187, 185, 185),
            ),
            label: 'premium',
          ),
        ]);
  }
}
