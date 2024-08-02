import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectfinal/submittedtrs.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Labtrs extends StatefulWidget {
  Labtrs({super.key, this.selectedgrade});
  String? selectedgrade;

  @override
  State<Labtrs> createState() => _LabtrsState();
}

class _LabtrsState extends State<Labtrs> {
  String gradeselected = "";
  String submittedornot = "";

  String status = 'Not Submitted';
  String heading = 'Status';

  String dateselected = DateFormat.MMMd().format(DateTime.now());
  List<Color> subcolor = [
    Colors.green,
    Colors.red,
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    getdata2();

    print("1111111111111111$gradeselected");
    print(submittedornot);
  }

  void getdata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String grades = sharedPreferences.getString("selectedgrade")!;
    print("22222222$grades");
    String submitstatus = sharedPreferences.getString("subdata")!;
    await sharedPreferences.clear();
    setState(() {
      gradeselected = grades;
      submittedornot = submitstatus;
      print(submittedornot);
      if (submittedornot == false) {
        status = 'Not Submitted';
        heading = 'Status';
      } else if (submittedornot == 'Submitted' && grades == "") {
        status = gradeselected;
        heading = 'Grade';
      } else if (submittedornot == 'Submitted' && gradeselected == grades) {
        status = gradeselected;
        heading = 'Grade';
      }
    });
  }

  void getdata2() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String submitstatus = sharedPreferences.getString("subdata")!;
    await sharedPreferences.clear();
    setState(() {
      submittedornot = submitstatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Container(
                width: 120,
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(23))),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5.5, right: 4, bottom: 5.5, left: 6.5),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                      Text(dateselected,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(23))),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5.5, right: 4, bottom: 5.5, left: 6.5),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                            ),
                          ),
                        ),
                      )
                    ])),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: ListView.builder(
              shrinkWrap: true,
              physics: PageScrollPhysics(),
              itemCount: 4,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          if (status == 'Not Submitted') {
                            var snackBar = SnackBar(
                              duration: Duration(seconds: 1),
                              backgroundColor: Colors.red.shade500,
                              content: const Text('Not yet submitted...!',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => socialsubmitedtrs()));
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("${index + 1}"),
                                        Text("Siva",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600))
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(heading),
                                        Text(
                                          status,
                                          style: TextStyle(
                                              color: status == 'Submitted' ||
                                                      status == gradeselected
                                                  ? Colors.green
                                                  : Colors.red),
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
