import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class morning extends StatefulWidget {
  const morning({super.key});
  @override
  State<morning> createState() => _morningState();
}

class _morningState extends State<morning> {
  Map<int, String> selectedOptions = {};

  List<String> studentsname = ["ANI", "ANOOP", "ANISH", "ANUSHA"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.only(
            top: 18.0, bottom: 18, left: 18.0, right: 18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: PageScrollPhysics(),
                  itemCount: 31,
                  itemBuilder: (BuildContext context, index) {
                    return Column(children: [
                      ListTile(
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        title: Row(
                          children: [
                            Text('${index + 01}'),
                            SizedBox(
                              width: 20,
                            ),
                            Text(studentsname[index % 4]),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedOptions[index] = 'Present';
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: selectedOptions[index] == 'Present'
                                        ? Colors.green
                                        : Colors.black,
                                  ),
                                  shape: BoxShape.circle,
                                  color: selectedOptions[index] == 'Present'
                                      ? Colors.green
                                      : Colors.white,
                                ),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'P',
                                  style: TextStyle(
                                      color: selectedOptions[index] == 'Present'
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              color: Colors.grey.shade300,
                              height: 35,
                              width: 1,
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedOptions[index] = 'Absent';
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: selectedOptions[index] == 'Absent'
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                  shape: BoxShape.circle,
                                  color: selectedOptions[index] == 'Absent'
                                      ? Colors.red
                                      : Colors.white,
                                ),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'A',
                                  style: TextStyle(
                                      color: selectedOptions[index] == 'Absent'
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ]);
                  }),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 20),
                child: Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          padding: WidgetStatePropertyAll(EdgeInsets.only(
                              top: 15, bottom: 15, left: 60, right: 60)),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                          backgroundColor: WidgetStatePropertyAll(
                              Color.fromARGB(255, 217, 183, 80))),
                      onPressed: () {},
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
