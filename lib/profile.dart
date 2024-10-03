import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:projectfinal/achivements.dart';
import 'package:projectfinal/address.dart';
import 'package:projectfinal/basicinfo.dart';
import 'package:projectfinal/certiificates.dart';
import 'package:projectfinal/contactinfo.dart';
import 'package:projectfinal/homepage.dart';
import 'package:projectfinal/loginscreen.dart';
import 'package:projectfinal/shareddata.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  Profile({
    super.key,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  File? _photo;
  final ImagePicker _picker = ImagePicker();
  String? _profilePicUrl;
  String? _email = "";
  String? _firstname = "";
  String? _lastname = '';
  String? _title = '';
  String? _dob = '';
  String? _placebirth = '';
  String? _statebirth = '';
  String? _religion = '';
  String? _height = '';
  String? _weight = '';
  String? _mothertongue = '';
  String? _caste = '';
  String? _nationality = '';
  String? _gender = '';
  String? _bldgrp = '';
  String? _address = '';
  String? _certificates = '';
  String? _achievements = '';
  String? _contact1 = '';
  String? _contact2 = '';

  @override
  void initState() {
    super.initState();
    ProfileDetails().initializeProfile();
    _loadString();
    _loadProfilePic();
    _loadEmail();
    _loadName();
  }

  Future<void> _loadString() async {
    // Obtain an instance of SharedPreferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Load data
    String nationality = sharedPreferences.getString('nationality') ?? '';
    String firstName = sharedPreferences.getString('firstname') ?? '';
    String lastName = sharedPreferences.getString('lastname') ?? '';
    String gender = sharedPreferences.getString('gender') ?? '';
    String bloodGroup = sharedPreferences.getString('bloodgroup') ?? '';
    String title = sharedPreferences.getString('title') ?? '';
    String dob = sharedPreferences.getString('dob') ?? '';
    String placeOfBirth = sharedPreferences.getString('placebirth') ?? '';
    String stateOfBirth = sharedPreferences.getString('statebirth') ?? '';
    String religion = sharedPreferences.getString('religion') ?? '';
    String height = sharedPreferences.getString('height') ?? '';
    String weight = sharedPreferences.getString('weight') ?? '';
    String motherTongue = sharedPreferences.getString('mothertongue') ?? '';
    String caste = sharedPreferences.getString('caste') ?? '';
    String email = sharedPreferences.getString('email') ?? '';
    String contactNum1 = sharedPreferences.getString('contact 1') ?? '';
    String contactNum2 = sharedPreferences.getString('contact 2') ?? '';
    String address = sharedPreferences.getString('address') ?? '';
    String certificates = sharedPreferences.getString('certificates') ?? '';
    String achievements = sharedPreferences.getString('achievements') ?? '';
    String profilePicUrl = sharedPreferences.getString('profilepic') ?? '';

    // Populate the controllers with the loaded data
    _nationality = nationality;
    _firstname = firstName;
    _lastname = lastName;
    _gender = gender;
    _bldgrp = bloodGroup;
    _title = title;
    _dob = dob;
    _placebirth = placeOfBirth;
    _statebirth = stateOfBirth;
    _religion = religion;
    _height = height;
    _weight = weight;
    _mothertongue = motherTongue;
    _caste = caste;
    _address = address;
    _certificates = certificates;
    _achievements = achievements;
    _contact1 = contactNum1;
    _contact2 = contactNum2;
    _email = email;

    _profilePicUrl = profilePicUrl;

    print('Profile information loaded from SharedPreferences');
  }

  Future<void> _loadProfilePic() async {
    String userId = '1yRPk63zD3oNq8OXh6wJ';
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
    String userId = '1yRPk63zD3oNq8OXh6wJ';
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

  Future<void> _loadName() async {
    String userId = '1yRPk63zD3oNq8OXh6wJ';
    try {
      DocumentSnapshot userDoc = await _firestore
          .collection('profiledetails')
          .doc(userId)
          .collection('basicinfo')
          .doc(userId)
          .get();

      if (userDoc.exists) {
        setState(() {
          _firstname = userDoc['firstname'] ?? 'No firstname';
          _lastname = userDoc['lastname'] ?? 'No lastname';
        });
      }
    } catch (e) {
      print('Error loading user name: $e');
    }
  }

  Future<void> _updateProfileDetails() async {
    if (_photo == null) {
      print('No photo selected');
      return;
    }
    final photoUrl = await _uploadFile();
    if (photoUrl.isEmpty) {
      print('Failed to upload photo');
      return;
    }

    String userId = '1yRPk63zD3oNq8OXh6wJ';
    final data = {
      'profilepic': photoUrl,
    };

    try {
      await _firestore.collection('profiledetails').doc(userId).update(data);
      print('Profile details updated successfully');
      setState(() {
        _profilePicUrl = photoUrl;
      });
    } catch (e) {
      print('Error occurred while updating profile details: $e');
    }
  }

  Future<void> _imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _photo = File(pickedFile.path);
      });
      await _updateProfileDetails();
    } else {
      print('No image selected.');
    }
  }

  Future<void> _imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _photo = File(pickedFile.path);
      });
      await _updateProfileDetails();
    } else {
      print('No image selected.');
    }
  }

  Future<String> _uploadFile() async {
    if (_photo == null) return '';
    final fileName = basename(_photo!.path);
    final destination = 'profilepic/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance.ref(destination);
      await ref.putFile(_photo!);
      return await ref.getDownloadURL();
    } catch (e) {
      print('Error occurred while uploading file: $e');
      return '';
    }
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Gallery'),
                  onTap: () {
                    _imgFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homepagestudent()));
              },
              icon: Icon(Icons.arrow_back_sharp)),
          backgroundColor: Color.fromARGB(255, 248, 247, 247),
          title: const Text('Profile',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500))),
      backgroundColor: Color.fromARGB(255, 248, 247, 247),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 18.0),
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
                        child: Text('${_firstname ?? ''} ${_lastname ?? ''}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                      ),
                      Text(_email.toString(), style: TextStyle(fontSize: 18))
                    ],
                  ),
                  GestureDetector(
                    onTap: () => _showPicker(context),
                    child: CircleAvatar(
                      backgroundImage: _profilePicUrl != null
                          ? NetworkImage(_profilePicUrl!)
                          : null,
                      child: _profilePicUrl == null
                          ? Icon(Icons.person, size: 28, color: Colors.grey)
                          : null,
                      radius: 28,
                    ),
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
                                                    Text(_title!),
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
                                                    Text(_firstname!),
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
                                                  children: [Text(_lastname!)],
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
                                                  children: [Text(_dob!)],
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
                                                  children: [Text(_gender!)],
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
                                                  children: [
                                                    Text(_nationality!)
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
                                                  children: [Text(_bldgrp!)],
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
                                                    Text(_placebirth!)
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
                                                    Text(_statebirth!)
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
                                                  children: [Text(_religion!)],
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
                                                  children: [Text(_height!)],
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
                                                  children: [Text(_weight!)],
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
                                                    Text("Mother tongue: ",
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
                                                    Text(_mothertongue!)
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
                                                  children: [Text(_caste!)],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 18.0,
                                        bottom: 18.0,
                                        left: 180.0,
                                        right: 18.0),
                                    child: Container(
                                      decoration:
                                          BoxDecoration(color: Colors.white),
                                      height: 60,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              shape: WidgetStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2))),
                                              backgroundColor:
                                                  WidgetStatePropertyAll(
                                                      Color.fromARGB(
                                                          255, 191, 160, 67))),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      personaldata(),
                                                ));
                                          },
                                          child: Text(
                                            'Edit',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black),
                                          )),
                                    ),
                                  ),
                                )
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
                                                    Text(_email!),
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
                                                    Text(_contact1!),
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
                                                  children: [Text(_contact2!)],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  top: BorderSide(
                                                      color: Colors.grey)),
                                              color: Colors.white),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 18.0,
                                                bottom: 18.0,
                                                left: 180.0,
                                                right: 18.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                              height: 60,
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                  style: ButtonStyle(
                                                      shape: WidgetStatePropertyAll(
                                                          RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .grey,
                                                                  width: 1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2))),
                                                      backgroundColor:
                                                          WidgetStatePropertyAll(
                                                              Color.fromARGB(
                                                                  255,
                                                                  191,
                                                                  160,
                                                                  67))),
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Contactinfo(),
                                                        ));
                                                  },
                                                  child: Text(
                                                    'Edit',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black),
                                                  )),
                                            ),
                                          ),
                                        )
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
                                                    Text(_address!),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  top: BorderSide(
                                                      color: Colors.grey)),
                                              color: Colors.white),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 18.0,
                                                bottom: 18.0,
                                                left: 180.0,
                                                right: 18.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                              height: 60,
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                  style: ButtonStyle(
                                                      shape: WidgetStatePropertyAll(
                                                          RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .grey,
                                                                  width: 1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2))),
                                                      backgroundColor:
                                                          WidgetStatePropertyAll(
                                                              Color.fromARGB(
                                                                  255,
                                                                  191,
                                                                  160,
                                                                  67))),
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Addressinfo()));
                                                  },
                                                  child: Text(
                                                    'Edit',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black),
                                                  )),
                                            ),
                                          ),
                                        )
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
                                                  Expanded(
                                                      child:
                                                          Text(_achievements!)),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(
                                                        color: Colors.grey)),
                                                color: Colors.white),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 18.0,
                                                  bottom: 18.0,
                                                  left: 180.0,
                                                  right: 18.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white),
                                                height: 60,
                                                width: double.infinity,
                                                child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        shape: WidgetStatePropertyAll(
                                                            RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2))),
                                                        backgroundColor:
                                                            WidgetStatePropertyAll(
                                                                Color.fromARGB(
                                                                    255,
                                                                    191,
                                                                    160,
                                                                    67))),
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  Achivements()));
                                                    },
                                                    child: Text(
                                                      'Edit',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.black),
                                                    )),
                                              ),
                                            ),
                                          )
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
                                                  Expanded(
                                                      child:
                                                          Text(_certificates!)),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(
                                                        color: Colors.grey)),
                                                color: Colors.white),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 18.0,
                                                  bottom: 18.0,
                                                  left: 180.0,
                                                  right: 18.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white),
                                                height: 60,
                                                width: double.infinity,
                                                child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        shape: WidgetStatePropertyAll(
                                                            RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2))),
                                                        backgroundColor:
                                                            WidgetStatePropertyAll(
                                                                Color.fromARGB(
                                                                    255,
                                                                    191,
                                                                    160,
                                                                    67))),
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  certiificates()));
                                                    },
                                                    child: Text(
                                                      'Edit',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.black),
                                                    )),
                                              ),
                                            ),
                                          )
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
              padding: const EdgeInsets.only(
                  top: 18.0, bottom: 18.0, left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Support",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              elevation: WidgetStatePropertyAll(0),
                              side: WidgetStatePropertyAll(
                                BorderSide(
                                    color: const Color.fromARGB(
                                        255, 232, 232, 232)),
                              ),
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.white),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)))),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Suggestion",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w400)),
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 18.0, bottom: 18.0, left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Legal",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              elevation: WidgetStatePropertyAll(0),
                              side: WidgetStatePropertyAll(
                                BorderSide(
                                    color: const Color.fromARGB(
                                        255, 232, 232, 232)),
                              ),
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.white),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)))),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("About us",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w400)),
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              elevation: WidgetStatePropertyAll(0),
                              side: WidgetStatePropertyAll(
                                BorderSide(
                                    color: const Color.fromARGB(
                                        255, 232, 232, 232)),
                              ),
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.white),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)))),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Terms an conditions",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w400)),
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              elevation: WidgetStatePropertyAll(0),
                              side: WidgetStatePropertyAll(
                                BorderSide(
                                    color: const Color.fromARGB(
                                        255, 232, 232, 232)),
                              ),
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.white),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => page1()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Logout",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w400)),
                            ],
                          )),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
