// ignore_for_file: file_names

import 'package:carbon/Components/ButtomNavBar.dart';
import 'package:carbon/Components/appColor.dart';
import 'package:carbon/screen/homeTab.dart';
import 'package:carbon/screen/profileTabs.dart';
import 'package:carbon/screen/tipsTab.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, String>> items = [
    {'image': 'assets/person.png', 'text': 'Person'},
    {'image': 'assets/all.png', 'text': 'All categories'},
    {'image': 'assets/waste.png', 'text': 'Waste'},
    {'image': 'assets/Energy.png', 'text': 'Energy'},
    {'image': 'assets/Consumption.png', 'text': 'consumption'},
    {'image': 'assets/travel.png', 'text': 'Travel'},

    // Add more items here
  ];

  @override
  Widget build(BuildContext context) {
    // var mywidth = MediaQuery.of(context).size.width;
    // var myheight = MediaQuery.of(context).size.height;

    final List<Widget> pages = [
      SingleChildScrollView(
        child: Column(
          children: [
            _selectedIndex == 0 ? const Hometab() : Container(),
          ],
        ),
      ),
      Column(
        children: [_selectedIndex == 1 ? const Tipstab() : Container()],
      ),
      _selectedIndex == 2 ? const Profiletabs() : Container(), // Content for Profile
    ];

    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
        items: [
          BottomNavItemData(icon: Icons.home_rounded, label: "Home"),
          BottomNavItemData(icon: Icons.event_note, label: "Tips"),
          BottomNavItemData(icon: Icons.person, label: "Profile"),
        ],
        selectedColor: AppColors.primaryColor,
        unselectedColor: AppColors.darkBottomBar,
        backgroundColor: Colors.white,
      ),
      body: pages[_selectedIndex],
    );
  }
}
