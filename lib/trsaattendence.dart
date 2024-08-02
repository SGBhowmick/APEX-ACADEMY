import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectfinal/afternoon.dart';
import 'package:projectfinal/morning.dart';

class Trsaattendence extends StatefulWidget {
  const Trsaattendence({super.key});

  @override
  State<Trsaattendence> createState() => _TrsaattendenceState();
}

class _TrsaattendenceState extends State<Trsaattendence> {
  String dateInput = "${DateFormat.MMMEd().format(DateTime.now())}";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 213, 208, 166),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Text('Attendence',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Column(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 163, 134, 45),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 6.0, bottom: 6, left: 18, right: 18),
                      child: Text(
                        "${DateFormat('dd-M-y').format(DateTime.now())}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 6,
                    indicatorPadding: EdgeInsets.only(left: 20, right: 20),
                    indicatorColor: Color.fromARGB(255, 158, 124, 20),
                    tabs: [
                      Tab(
                        child: Text(
                          "Morning",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Tab(
                          child: Text(
                        "Afternoon",
                        style: TextStyle(color: Colors.black),
                      )),
                    ]),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: morning()),
            Center(child: Afternoon()),
          ],
        ),
      ),
    );
  }
}
