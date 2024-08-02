import 'package:flutter/material.dart';
import 'package:projectfinal/assignmentstrs.dart';
import 'package:projectfinal/hometeacher.dart';
import 'package:projectfinal/labtrs.dart';

class Selectedrecordstrs extends StatefulWidget {
  const Selectedrecordstrs({super.key});

  @override
  State<Selectedrecordstrs> createState() => _SelectedrecordstrsState();
}

class _SelectedrecordstrsState extends State<Selectedrecordstrs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_sharp, color: Colors.black),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => homepageteacher()));
            },
          ),
          backgroundColor: Color.fromARGB(255, 229, 224, 172),
          title: const Text('Social',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 6,
                indicatorPadding: EdgeInsets.only(left: 20, right: 20),
                indicatorColor: Color.fromARGB(255, 158, 124, 20),
                tabs: [
                  Tab(
                    child: Text(
                      "Assignments",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                      child: Text(
                    "Lab",
                    style: TextStyle(color: Colors.black),
                  )),
                ]),
          ),
        ),
        body: TabBarView(
          children: [
            Tab(
              child: Assignmentstrs(),
            ),
            Tab(child: Labtrs())
          ],
        ),
      ),
    );
  }
}
