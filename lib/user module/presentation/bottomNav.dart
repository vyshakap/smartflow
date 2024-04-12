import 'package:flutter/material.dart';
import 'package:traffics/user%20module/presentation/home.dart';
import 'package:traffics/user%20module/presentation/user_profile.dart';

class BottomnavScreen extends StatefulWidget {
  BottomnavScreen({super.key});

  @override
  State<BottomnavScreen> createState() => _BottomnavScreenState();
}

class _BottomnavScreenState extends State<BottomnavScreen> {


  ValueNotifier<int> currentIndex = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
      final pages = [
        ProfileEightPage(),
        UserHome(),

  ];
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: currentIndex,
      builder: (BuildContext context, value, Widget? child) {return pages[currentIndex.value] ; },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex.value,
        onTap: (value) {
          setState(() {
            currentIndex.value = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person ),backgroundColor: Color.fromARGB(255, 31, 2, 145),label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.home),backgroundColor: Color.fromARGB(255, 31, 2, 145),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.notification_add),backgroundColor: Color.fromARGB(255, 31, 2, 145),label: "Notifications"),
          ])
    );
  }
}