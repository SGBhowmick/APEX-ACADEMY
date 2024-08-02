import 'package:flutter/material.dart';

class lab extends StatefulWidget {
  const lab({super.key});

  @override
  State<lab> createState() => _labState();
}

class _labState extends State<lab> {
  List<Color> atdcolor = [
    Colors.green,
    Colors.green,
    Colors.red,
  ];
  List<Color> subcolor = [
    Colors.green,
    Colors.red,
    Colors.black,
  ];
  List<String> submittedornot = [
    'Completed',
    'Incomplete',
    '___',
  ];
  List<String> atdstatus = [
    'Present',
    'Present',
    'Absent',
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
                        onTap: () {},
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
                                        Text("Attendence"),
                                        Text(
                                          "${atdstatus[index]}",
                                          style:
                                              TextStyle(color: atdcolor[index]),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [Text("Grade"), Text('----')],
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
