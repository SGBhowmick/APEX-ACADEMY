import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projectfinal/hometeacher.dart';
import 'package:projectfinal/loginscreen.dart';
import 'package:projectfinal/studentsprofile.dart';

// ignore: must_be_immutable
class Studentlist extends StatefulWidget {
  Studentlist({super.key});
  List<String> studentsname = ["ANI", "ANOOP", "ANISH", "ANUSHA"];

  State<Studentlist> createState() => _StudentlistState();
}

class _StudentlistState extends State<Studentlist> {
  Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 247, 247),
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homepageteacher()));
              },
              icon: Icon(Icons.arrow_back_sharp)),
          backgroundColor: Color.fromARGB(255, 248, 247, 247),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => page1()));
                },
                icon: Icon(Icons.logout_outlined))
          ],
          title: const Text('Students',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                child: Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Search by name or roll no',
                        prefixIcon: Icon(Icons.search_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(28)),
                        )),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                  child: Container(
                      height: 660,
                      child: Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              itemCount: 60,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 120,
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 4.0,
                                      mainAxisSpacing: 4.0),
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Studentsprofile()));
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                              radius: 30,
                                              backgroundImage: NetworkImage(
                                                  "https://static.vecteezy.com/system/resources/previews/024/772/289/large_2x/young-male-student-at-university-campus-photo.jpg")),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                    "${widget.studentsname[random.nextInt(4)]}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                Text("${index + 1}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
