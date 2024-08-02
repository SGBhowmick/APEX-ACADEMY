// ignore_for_file: non_constant_identifier_names

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:projectfinal/Studentlist.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Studentsprofile extends StatefulWidget {
  Studentsprofile({
    super.key,
  });

  @override
  State<Studentsprofile> createState() => _StudentsprofileState();
}

class _StudentsprofileState extends State<Studentsprofile> {
  String? Title = "";
  String? Firstname = "";
  String? Lastname = "";
  String? Dob = "";
  String? Gender = "";
  String? Nation = "";
  String? Bloodgroup = "";
  String? Placeofbirth = "";
  String? Stateofbirth = "";
  String? Religion = "";
  String? Height = "";
  String? Weight = "";
  String? Mothertongue = "";
  String? Caste = "";
  String? Email = "";
  String? Contact1 = "";
  String? Contact2 = "";
  String? Address = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getstring();
  }

  void getstring() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String nationality = sharedPreferences.getString("nationality")!;
    String title = sharedPreferences.getString("title")!;
    String firstname = sharedPreferences.getString("firstname")!;
    String lastname = sharedPreferences.getString("lastname")!;
    String dob = sharedPreferences.getString("dob")!;
    String gender = sharedPreferences.getString("gender")!;
    String bloodgroup = sharedPreferences.getString("bloodgroup")!;
    String placebirth = sharedPreferences.getString("placebirth")!;
    String statebirth = sharedPreferences.getString("statebirth")!;
    String religion = sharedPreferences.getString("religion")!;
    String height = sharedPreferences.getString("height")!;
    String weight = sharedPreferences.getString("weight")!;
    String mothertongue = sharedPreferences.getString("mothertongue")!;
    String caste = sharedPreferences.getString("caste")!;
    String email = sharedPreferences.getString("email")!;
    String contactnum1 = sharedPreferences.getString("ctnum1")!;
    String contactnum2 = sharedPreferences.getString("ctnum2")!;
    String address = sharedPreferences.getString("address")!;

    setState(() {
      Nation = nationality;
      Title = title;
      Firstname = firstname;
      Lastname = lastname;
      Dob = dob;
      Gender = gender;
      Bloodgroup = bloodgroup;
      Placeofbirth = placebirth;
      Placeofbirth = statebirth;
      Religion = religion;
      Height = height;
      Weight = weight;
      Mothertongue = mothertongue;
      Caste = caste;
      Email = email;
      Contact1 = contactnum1;
      Contact2 = contactnum2;
      Address = address;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 247, 247),
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Studentlist()));
              },
              icon: Icon(Icons.arrow_back_sharp)),
          backgroundColor: Color.fromARGB(255, 248, 247, 247),
          title: const Text('Profile',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500))),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 18.0, bottom: 18, left: 10, right: 10),
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
              padding: const EdgeInsets.only(
                  top: 1.0, bottom: 18.0, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Profile Completeness",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: const Color.fromARGB(255, 232, 232, 232)),
                        borderRadius: BorderRadius.circular(6)),
                    child: ExpansionTile(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: const Color.fromARGB(255, 232, 232, 232)),
                          borderRadius: BorderRadius.circular(6)),
                      title: Text('Personal Information',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400)),
                      children: [
                        Container(
                            width: double.infinity,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            )),
                        ExpansionTile(
                          collapsedBackgroundColor:
                              Color.fromARGB(255, 248, 247, 247),
                          backgroundColor: Color.fromARGB(255, 248, 247, 247),
                          title: Text('Basic Information',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400)),
                          children: [
                            Column(
                              children: [
                                SingleChildScrollView(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                            top: BorderSide(color: Colors.grey),
                                            bottom: BorderSide(
                                                color: Colors.grey))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 18.0,
                                              bottom: 8.0,
                                              left: 24,
                                              right: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text("Title: ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(Title!),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 8.0,
                                              left: 24,
                                              right: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text("First Name:",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text(Firstname!),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 8.0,
                                              left: 24,
                                              right: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text("last Name: ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600))
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [Text(Lastname!)],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 8.0,
                                              left: 24,
                                              right: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text("DOB: ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600))
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [Text(Dob!)],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 8.0,
                                              left: 24,
                                              right: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text("Gender: ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600))
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [Text(Gender!)],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 8.0,
                                              left: 24,
                                              right: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text("Nationality: ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600))
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [Text(Nation!)],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 8.0,
                                              left: 24,
                                              right: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text("Blood Group: ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600))
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [Text(Bloodgroup!)],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 8.0,
                                              left: 24,
                                              right: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text("Place of Birth: ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600))
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text(Placeofbirth!)
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 8.0,
                                              left: 24,
                                              right: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text("State of Birth: ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600))
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text(Stateofbirth!)
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 8.0,
                                              left: 24,
                                              right: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text("Religion: ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600))
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [Text(Religion!)],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 8.0,
                                              left: 24,
                                              right: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text("Height (cm): ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600))
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [Text(Height!)],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 8.0,
                                              left: 24,
                                              right: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text("Weight (cm): ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600))
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [Text(Weight!)],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 8.0,
                                              left: 24,
                                              right: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text("Mother Tongue: ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600))
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text(Mothertongue!)
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 18.0,
                                              left: 24,
                                              right: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text("Caste: ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600))
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [Text(Caste!)],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                            width: double.infinity,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 202, 200, 200),
                            )),
                        ExpansionTile(
                          collapsedBackgroundColor:
                              Color.fromARGB(255, 248, 247, 247),
                          backgroundColor: Color.fromARGB(255, 248, 247, 247),
                          title: Text('Contact Information',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400)),
                          children: [
                            Column(
                              children: [
                                SingleChildScrollView(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                            top: BorderSide(color: Colors.grey),
                                            bottom: BorderSide(
                                                color: Colors.grey))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 18.0,
                                              bottom: 8.0,
                                              left: 24,
                                              right: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text("Email: ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(Email!),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 8.0,
                                              left: 24,
                                              right: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text("Contact No: 1:",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text(Contact1!),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 18.0,
                                              left: 24,
                                              right: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text("Contact No: 2: ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600))
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [Text(Contact2!)],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                            width: double.infinity,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 202, 200, 200),
                            )),
                        ExpansionTile(
                          collapsedBackgroundColor:
                              Color.fromARGB(255, 248, 247, 247),
                          backgroundColor: Color.fromARGB(255, 248, 247, 247),
                          title: Text('Address',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400)),
                          children: [
                            Column(
                              children: [
                                SingleChildScrollView(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                            top: BorderSide(color: Colors.grey),
                                            bottom: BorderSide(
                                                color: Colors.grey))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 18.0,
                                              bottom: 8.0,
                                              left: 24,
                                              right: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text("Address: ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(Address!),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                            width: double.infinity,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 202, 200, 200),
                            )),
                      ],
                    ),
                  ),
                ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 232, 232, 232))),
                          child: ExpansionTileCard(
                            baseColor: Colors.white,
                            elevation: 0,
                            expandedColor: Colors.white,
                            title: Text('Achivements',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w400)),
                            children: [
                              Column(
                                children: [
                                  SingleChildScrollView(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border(
                                              top: BorderSide(
                                                  color: Colors.grey),
                                              bottom: BorderSide(
                                                  color: Colors.grey))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 18.0,
                                                bottom: 28.0,
                                                left: 24,
                                                right: 18),
                                            child: Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(child: Text("")),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 232, 232, 232))),
                          child: ExpansionTileCard(
                            baseColor: Colors.white,
                            elevation: 0,
                            expandedColor: Colors.white,
                            title: Text('Certificates',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w400)),
                            children: [
                              Column(
                                children: [
                                  SingleChildScrollView(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border(
                                              top: BorderSide(
                                                  color: Colors.grey),
                                              bottom: BorderSide(
                                                  color: Colors.grey))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 18.0,
                                                bottom: 28.0,
                                                left: 24,
                                                right: 18),
                                            child: Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(child: Text("")),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )))
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
