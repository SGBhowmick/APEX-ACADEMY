import 'package:bottom_navbar_with_indicator/bottom_navbar_with_indicator.dart';
import 'package:flutter/material.dart';
import 'package:projectfinal/attendence.dart';
import 'package:projectfinal/events.dart';
import 'package:projectfinal/home.dart';
import 'package:projectfinal/records.dart';

class homepagestudent extends StatefulWidget {
  const homepagestudent({super.key});

  @override
  State<homepagestudent> createState() => _homepagestudentState();
}

class _homepagestudentState extends State<homepagestudent> {
  int _selectedIndex = 0;

  final List<Widget> _tabOptions = [Home(), Records(), Attendence(), Events()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabOptions.elementAt(_selectedIndex),
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: Color.fromARGB(255, 176, 150, 6),
        unSelectedColor: Colors.black54,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedIconSize: 30,
        unselectedIconSize: 30,
        enableLineIndicator: true,
        lineIndicatorWidth: 4,
        indicatorType: IndicatorType.top,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        customBottomBarItems: [
          CustomBottomBarItems(
            label: 'Home',
            icon: (Icons.home),
            isAssetsImage: false,
          ),
          CustomBottomBarItems(
            label: 'Records',
            icon: Icons.import_contacts_outlined,
            isAssetsImage: false,
          ),
          CustomBottomBarItems(
            label: 'Attendence',
            icon: Icons.check_circle_outline,
            isAssetsImage: false,
          ),
          CustomBottomBarItems(
            label: 'Events',
            icon: Icons.calendar_today_rounded,
            isAssetsImage: false,
          ),
        ],
      ),
    );
  }
}
