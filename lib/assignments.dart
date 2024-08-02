import 'package:flutter/material.dart';
import 'package:projectfinal/notsubmitted.dart';
import 'package:projectfinal/submitted.dart';

class Assignments extends StatefulWidget {
  const Assignments({super.key});

  @override
  State<Assignments> createState() => _AssignmentsState();
}

class _AssignmentsState extends State<Assignments> {
  List<String> submittedornot = [
    'Submitted',
    'Not Submitted',
    'Submitted',
  ];
  List<dynamic> grade = [
    "A",
    "___",
    "A",
  ];

  List<Color> subcolor = [
    Colors.green,
    Colors.red,
    Colors.green,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(23))),
                      child: Padding(
                        padding: const EdgeInsets.all(5.5),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Jan- 2024",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(23))),
                      child: Padding(
                        padding: const EdgeInsets.all(5.5),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: ListView.builder(
              shrinkWrap: true,
              physics: PageScrollPhysics(),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          if (submittedornot[index] == 'Not Submitted') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => socialnotsubmited()));
                          } else
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => socialsubmited()));
                        },
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Nov 14"),
                              Text("Science role in modern warfare",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Deadline"),
                                        Text("Nov 14,12:30 PM")
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Grade"),
                                        Text(
                                          '${grade[index]}',
                                          style:
                                              TextStyle(color: subcolor[index]),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Status"),
                                        Text(
                                          '${submittedornot[index]}',
                                          style:
                                              TextStyle(color: subcolor[index]),
                                        )
                                      ],
                                    ),
                                  ])
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        width: double.infinity,
                        height: 1,
                        color: Color.fromARGB(255, 201, 200, 200),
                      )
                    ],
                  ),
                );
              }),
        )
      ]),
    );
  }
}
