import 'package:flutter/material.dart';
import 'package:projectfinal/grade.dart';
import 'package:projectfinal/selectedrecordstrs.dart';

class socialsubmitedtrs extends StatefulWidget {
  const socialsubmitedtrs({super.key});

  @override
  State<socialsubmitedtrs> createState() => _socialsubmitedtrsState();
}

class _socialsubmitedtrsState extends State<socialsubmitedtrs> {
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
                MaterialPageRoute(builder: (context) => Selectedrecordstrs()));
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
          Expanded(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0, right: 60),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: PageScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(children: [
                                Container(
                                  height: 220,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        new BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 10.0,
                                        ),
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.only(
                                              top: 16, left: 16, right: 16),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://www.educomiq.com/wp-content/uploads/2020/03/8th-Social-3.png"),
                                                fit: BoxFit.fill),
                                            border:
                                                Border.all(color: Colors.grey),
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        color:
                                            Color.fromARGB(255, 229, 224, 172),
                                        width: double.infinity,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Wrap(
                                                children: [
                                                  Container(
                                                    height: 20,
                                                    width: 20,
                                                    child: Image.asset(
                                                        "assets/icons/imageicon.png"),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text("Social.jpg"),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Icon(Icons
                                                  .remove_red_eye_outlined),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Icon(
                                                  Icons.file_download_outlined),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 25),
                              ]);
                            }),
                      )
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Selectedrecordstrs()));
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Grade()));
                    },
                    child: Text(
                      "Grade",
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
