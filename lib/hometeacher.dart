import 'package:bottom_navbar_with_indicator/bottom_navbar_with_indicator.dart';
import 'package:flutter/material.dart';
import 'package:projectfinal/events.dart';
import 'package:projectfinal/homethr.dart';
import 'package:projectfinal/recordstrs.dart';
import 'package:projectfinal/trsaattendence.dart';

class homepageteacher extends StatefulWidget {
  final int initialIndex;

  const homepageteacher({super.key, this.initialIndex = 0});

  @override
  State<homepageteacher> createState() => _homepageteacherState();
}

class _homepageteacherState extends State<homepageteacher> {
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

  final List<Widget> _tabOptions = [
    HomeTrs(),
    Recordstrs(),
    Trsaattendence(),
    Events()
  ];

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
