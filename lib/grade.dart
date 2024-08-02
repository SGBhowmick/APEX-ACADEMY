import 'package:flutter/material.dart';
import 'package:projectfinal/selectedrecordstrs.dart';
import 'package:projectfinal/submittedtrs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Grade extends StatefulWidget {
  const Grade({super.key});

  @override
  State<Grade> createState() => _GradeState();
}

class _GradeState extends State<Grade> {
  List<String> grade = ["A", "B", "C", "D"];
  int? selectedIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gradedata();
  }

  void gradedata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String sgrade = grade[selectedIndex!];
    print("grade----$sgrade");
    sharedPreferences.setString('selectedgrade', sgrade);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => socialsubmitedtrs()));
          },
        ),
        backgroundColor: Color.fromARGB(255, 229, 224, 172),
        title: const Text('Social role in modern',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  child: Column(
                    children: [
                      Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 229, 224, 172),
                          )),
                      Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          )),
                    ],
                  ),
                ),
                Positioned(
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 18, right: 18),
                      height: 110,
                      child: Center(
                        child: Row(
                          children: [
                            Container(
                                width: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12)),
                                  color: Color.fromARGB(255, 196, 165, 74),
                                )),
                            Expanded(
                              child: Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(right: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 14.0, top: 10, bottom: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Submitted",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.green),
                                        ),
                                        Text(
                                          "Science Role in modern warfare",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text("10.30"),
                                        Text("Nov 17")
                                      ],
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Grade",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Expanded(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 30),
                          child: ListView.builder(
                            itemCount: grade.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  selectedColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side:
                                        BorderSide(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  title: Text(grade[index]),
                                  tileColor: selectedIndex == index
                                      ? Color.fromARGB(255, 251, 228, 162)
                                      : Colors.white,
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                ),
                              );
                            },
                          ))
                    ],
                  ),
                )),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Expanded(
              child: SizedBox(
                height: 70,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = null;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Selectedrecordstrs(),
                          ));
                    },
                    child: Text("Cancel",
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                          side: BorderSide(
                              color: Color.fromARGB(255, 172, 142, 52)))),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    )),
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Expanded(
              child: SizedBox(
                height: 70,
                child: ElevatedButton(
                    onPressed: () {
                      gradedata();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Selectedrecordstrs()));
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3))),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 196, 165, 74)),
                    )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
