import 'package:flutter/material.dart';
import 'package:projectfinal/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class personaldata extends StatefulWidget {
  const personaldata({super.key});
  @override
  State<personaldata> createState() => _personaldataState();
}

class _personaldataState extends State<personaldata> {
  var firstnmecontroller = TextEditingController();
  var lastnmecontroller = TextEditingController();
  var ncontroller = TextEditingController();
  var gendercontroller = TextEditingController();
  var bloodgroupcontroller = TextEditingController();
  var titlecontroller = TextEditingController();
  var dobcontroller = TextEditingController();
  var placebirthcontroller = TextEditingController();
  var statebirthcontroller = TextEditingController();
  var religioncontroller = TextEditingController();
  var heightcontroller = TextEditingController();
  var weightcontroller = TextEditingController();
  var mothertonguecontroller = TextEditingController();
  var castecontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    savestring();
  }

  void savestring() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('nationality', ncontroller.text);
    sharedPreferences.setString('firstname', firstnmecontroller.text);
    sharedPreferences.setString('lastname', lastnmecontroller.text);
    sharedPreferences.setString('gender', gendercontroller.text);
    sharedPreferences.setString('bloodgroup', bloodgroupcontroller.text);
    sharedPreferences.setString('title', titlecontroller.text);
    sharedPreferences.setString('dob', dobcontroller.text);
    sharedPreferences.setString('placebirth', placebirthcontroller.text);
    sharedPreferences.setString('statebirth', statebirthcontroller.text);
    sharedPreferences.setString('religion', religioncontroller.text);
    sharedPreferences.setString('height', heightcontroller.text);
    sharedPreferences.setString('weight', weightcontroller.text);
    sharedPreferences.setString('mothertongue', mothertonguecontroller.text);
    sharedPreferences.setString('caste', castecontroller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 229, 229, 229),
          title: const Text('Profile',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500))),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text('Name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                  Text('email.com', style: TextStyle(fontSize: 18))
                ],
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(""),
                radius: 28,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 10),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey)),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10))),
            child: Row(
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "Edit Basic Information",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                )),
              ],
            ),
          ),
        ),
        Expanded(
            child: ListView(children: [
          Container(
            margin: EdgeInsets.only(left: 18, right: 18),
            color: Colors.white,
            child: Column(children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 28.0, left: 18.0, right: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Changes with Administator Validation",
                      style: TextStyle(
                          color: Color.fromARGB(255, 82, 82, 82),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 18.0, left: 18.0, bottom: 18, right: 198),
                child: TextField(
                  controller: titlecontroller,
                  decoration: InputDecoration(
                      hintText: 'Title',
                      labelText: 'Title:',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 18.0, bottom: 18, right: 10),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        controller: firstnmecontroller,
                        decoration: InputDecoration(
                            hintText: 'First Name',
                            labelText: 'First Name:',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 18.0, bottom: 18, left: 10),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        controller: lastnmecontroller,
                        decoration: InputDecoration(
                            hintText: 'last Name',
                            labelText: 'last Name:',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 18.0, bottom: 18, right: 10),
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        controller: dobcontroller,
                        decoration: InputDecoration(
                            hintText: 'DOB',
                            labelText: 'DOB:',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 18.0, bottom: 18, left: 10),
                      child: TextField(
                        controller: gendercontroller,
                        decoration: InputDecoration(
                            hintText: 'Gender',
                            labelText: 'Gender:',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 18.0, bottom: 18, right: 10),
                      child: TextField(
                        controller: ncontroller,
                        decoration: InputDecoration(
                            hintText: 'Natonality',
                            labelText: 'Natonality:',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 18.0, bottom: 18, left: 10),
                      child: TextField(
                        controller: bloodgroupcontroller,
                        decoration: InputDecoration(
                            hintText: 'Blood Group',
                            labelText: 'Blood Group:',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Changes with Self Validation",
                      style: TextStyle(
                          color: Color.fromARGB(255, 82, 82, 82),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 18.0, left: 18.0, bottom: 18, right: 198),
                      child: TextField(
                        controller: placebirthcontroller,
                        decoration: InputDecoration(
                            hintText: 'Place of Birth',
                            labelText: 'Place of Birth:',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 18.0, bottom: 18, right: 10),
                      child: TextField(
                        controller: statebirthcontroller,
                        decoration: InputDecoration(
                            hintText: 'State of Birth',
                            labelText: 'State of Birth:',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 18.0, bottom: 18, left: 10),
                      child: TextField(
                        controller: religioncontroller,
                        decoration: InputDecoration(
                            hintText: 'Religion',
                            labelText: 'Religion:',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 18.0, bottom: 18, right: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: heightcontroller,
                        decoration: InputDecoration(
                            hintText: 'Height (in cm)',
                            labelText: 'Height (in cm):',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 18.0, bottom: 18, left: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: weightcontroller,
                        decoration: InputDecoration(
                            hintText: 'Weight (in kg)',
                            labelText: 'Weight (in kg):',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 18.0, bottom: 18, right: 10),
                      child: TextField(
                        controller: mothertonguecontroller,
                        decoration: InputDecoration(
                            hintText: 'Mother Tongue',
                            labelText: 'Mother Tongue:',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 18.0, bottom: 18, left: 10),
                      child: TextField(
                        controller: castecontroller,
                        decoration: InputDecoration(
                            hintText: 'Caste',
                            labelText: 'Caste:',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Note -",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("1.",
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                        Expanded(
                          child: Text(
                              ' At the end of updating all the data please click ${'Submit'} button',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("2.",
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                        Expanded(
                          child: Text(
                              'Changes with "Self Validation" will be automatically updated into your master data and does not require any proof',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("3.",
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                        Expanded(
                          child: Text(
                              'Changes with "Administrator" will be attended by the class teacher and approved by the administrator and confirm',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                        )
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
        ])),
      ]),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 3),
        height: 100,
        color: Colors.transparent,
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Cancel",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    side: BorderSide(
                                        color: Color.fromARGB(
                                            255, 172, 142, 52)))),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      child: ElevatedButton(
                          onPressed: () {
                            savestring();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profile(
                                    fname: firstnmecontroller.text,
                                    lname: lastnmecontroller.text,
                                    nationality: ncontroller.text,
                                    gender: gendercontroller.text,
                                    bldgrp: bloodgroupcontroller.text,
                                    tle: titlecontroller.text,
                                    dob: dobcontroller.text,
                                    pbc: placebirthcontroller.text,
                                    sbc: statebirthcontroller.text,
                                    rlgn: religioncontroller.text,
                                    hght: heightcontroller.text,
                                    wght: weightcontroller.text,
                                    mgtc: mothertonguecontroller.text,
                                    caste: castecontroller.text,
                                  ),
                                ));
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3))),
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 196, 165, 74)),
                          )),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
