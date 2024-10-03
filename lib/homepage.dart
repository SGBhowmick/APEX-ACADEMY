import 'package:bottom_navbar_with_indicator/bottom_navbar_with_indicator.dart';
import 'package:flutter/material.dart';
import 'package:projectfinal/attendence.dart';
import 'package:projectfinal/events.dart';
import 'package:projectfinal/home.dart';
import 'package:projectfinal/records.dart';

class homepagestudent extends StatefulWidget {
  final int initialIndex;

  const homepagestudent({super.key, this.initialIndex = 0});

  @override
  State<homepagestudent> createState() => _homepagestudentState();
}

class _homepagestudentState extends State<homepagestudent> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex; // Set the initial tab index
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  final List<Widget> _tabOptions = [Home(), Records(), Attendence(), Events()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabOptions.elementAt(_selectedIndex),
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: Color.fromARGB(255, 216, 185, 8),
        splashColor: Colors.amberAccent,
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
            assetsImagePath: "assets/icons/home.png",
            label: 'Home',
            isAssetsImage: true,
          ),
          CustomBottomBarItems(
            label: 'Records',
            assetsImagePath: "assets/icons/book.png",
            isAssetsImage: true,
          ),
          CustomBottomBarItems(
            label: 'Attendence',
            assetsImagePath: "assets/icons/attendance.png",
            isAssetsImage: true,
          ),
          CustomBottomBarItems(
            label: 'Events',
            assetsImagePath: "assets/icons/events.png",
            isAssetsImage: true,
          ),
        ],
      ),
    );
  }
}
