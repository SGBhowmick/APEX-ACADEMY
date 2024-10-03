import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectfinal/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class personaldata extends StatefulWidget {
  const personaldata({super.key});
  @override
  State<personaldata> createState() => _personaldataState();
}

class _personaldataState extends State<personaldata> {
  String userId = '1yRPk63zD3oNq8OXh6wJ';

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  TextEditingController stateOfBirthController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController motherTongueController = TextEditingController();
  TextEditingController casteController = TextEditingController();

  String? _profilePicUrl = '';
  String? _email = "";
  String? _fname = "";
  String? _lname = "";

  @override
  void initState() {
    super.initState();
    _loadSavedData();
    _loadProfilePic();
    _loadEmail();
    _loadName();
  }

  Future<void> _loadName() async {
    try {
      DocumentSnapshot userDoc = await _firestore
          .collection('profiledetails')
          .doc(userId)
          .collection('basicinfo')
          .doc(userId)
          .get();

      if (userDoc.exists) {
        setState(() {
          _fname = userDoc['firstname'] ?? 'No firstname';
          _lname = userDoc['lastname'] ?? 'No lastname';
        });
      }
    } catch (e) {
      print('Error loading user name: $e');
    }
  }

  Future<void> _loadProfilePic() async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('profiledetails').doc(userId).get();
      if (doc.exists && doc.data() != null) {
        setState(() {
          _profilePicUrl = doc['profilepic'] as String?;
        });
      }
    } catch (e) {
      print('Error loading profile picture: $e');
    }
  }

  Future<void> _loadEmail() async {
    try {
      DocumentSnapshot userDoc = await _firestore
          .collection('profiledetails')
          .doc(userId)
          .collection('contactinfo')
          .doc(userId)
          .get();

      if (userDoc.exists) {
        setState(() {
          _email = userDoc['email'] ?? 'No email';
        });
      }
    } catch (e) {
      print('Error loading user email: $e');
    }
  }

  Future<void> _loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      nationalityController.text =
          sharedPreferences.getString('nationality') ?? '';
      firstNameController.text = sharedPreferences.getString('firstname') ?? '';
      lastNameController.text = sharedPreferences.getString('lastname') ?? '';
      genderController.text = sharedPreferences.getString('gender') ?? '';
      bloodGroupController.text =
          sharedPreferences.getString('bloodgroup') ?? '';
      titleController.text = sharedPreferences.getString('title') ?? '';
      dobController.text = sharedPreferences.getString('dob') ?? '';
      placeOfBirthController.text =
          sharedPreferences.getString('placebirth') ?? '';
      stateOfBirthController.text =
          sharedPreferences.getString('statebirth') ?? '';
      religionController.text = sharedPreferences.getString('religion') ?? '';
      heightController.text = sharedPreferences.getString('height') ?? '';
      weightController.text = sharedPreferences.getString('weight') ?? '';
      motherTongueController.text =
          sharedPreferences.getString('mothertongue') ?? '';
      casteController.text = sharedPreferences.getString('caste') ?? '';
    });
  }

  Future<void> _addProfileDetails(String userId) async {
    final data = {
      'nationality': nationalityController.text,
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'gender': genderController.text,
      'bloodgroup': bloodGroupController.text,
      'title': titleController.text,
      'dob': dobController.text,
      'placebirth': placeOfBirthController.text,
      'statebirth': stateOfBirthController.text,
      'religion': religionController.text,
      'height': heightController.text,
      'weight': weightController.text,
      'mothertongue': motherTongueController.text,
      'caste': casteController.text,
    };

    try {
      await _firestore
          .collection('profiledetails')
          .doc(userId)
          .collection('basicinfo')
          .doc(userId)
          .set(data, SetOptions(merge: true));
      print('Profile details added successfully');
    } catch (e) {
      print('Error occurred while adding profile details: $e');
    }
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
                    child: Text('${_fname ?? ''} ${_lname ?? ''}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                  Text(_email!, style: TextStyle(fontSize: 18))
                ],
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(_profilePicUrl!),
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
                  controller: titleController,
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
                        controller: firstNameController,
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
                        controller: lastNameController,
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
                        controller: dobController,
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
                        controller: genderController,
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
                        controller: nationalityController,
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
                        controller: bloodGroupController,
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
                        controller: placeOfBirthController,
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
                        controller: stateOfBirthController,
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
                        controller: religionController,
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
                        controller: heightController,
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
                        controller: weightController,
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
                        controller: motherTongueController,
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
                        controller: casteController,
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
                          onPressed: () async {
                            await _addProfileDetails(userId);
                            print('Profile details saved');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profile(),
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
