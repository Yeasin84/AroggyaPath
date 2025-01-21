import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import './home_screen.dart';
import '../record/document_screen.dart';
import '../news/news_screen.dart';

class MainPage extends StatefulWidget { // Declare the userId parameter
  const MainPage({super.key});  // Make sure it's a named parameter

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const DoctorAppoinmentHomeScreen(),
      NewsScreen(),
      DocumentScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black26,
        selectedItemColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home5),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.message),
            label: "News",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.calendar),
            label: "Records",
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
