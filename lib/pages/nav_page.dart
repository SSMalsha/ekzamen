import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:ekzamen/pages/alarm_page.dart';
import 'package:ekzamen/pages/file_page.dart';
import 'package:ekzamen/pages/home_page.dart';
import 'package:ekzamen/pages/map_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {

  List pages = [
    FilePage(),
    ReminderPage(),
    MapPage(),
    HomePage(),
  ];

  int currentIndex = 0;
  
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: pages[currentIndex], //filepage

      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,

        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 114, 181, 237),
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Color.fromARGB(228, 0, 0, 0),
        unselectedItemColor: Color.fromARGB(255, 48, 110, 173),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,

        items: [
          BottomNavigationBarItem(
            //title:Text("Files"), 
            icon: Icon(Icons.apps),
            label: "Files",
            ),
            BottomNavigationBarItem(
            //title:Text("Reminder"), 
            icon: Icon(Icons.alarm_add_rounded),
            label: "Reminder",
            ),
            BottomNavigationBarItem(
            //title:Text("Map"), 
            icon: Icon(Icons.maps_home_work),
            label: "Map",
            ),
            BottomNavigationBarItem(
            //title:Text("Profile"), 
            icon: Icon(Icons.person),
            label: "Profile",
            ),
        ],
      ) ,
    );
  }
}