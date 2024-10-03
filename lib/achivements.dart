import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectfinal/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Achivements extends StatefulWidget {
  const Achivements({super.key});

  @override
  State<Achivements> createState() => _AchivementsState();
}

class _AchivementsState extends State<Achivements> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String userId = '1yRPk63zD3oNq8OXh6wJ';

  var achmtscontroller = TextEditingController();

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
      achmtscontroller.text = sharedPreferences.getString('achievements') ?? '';
    });
  }

  Future<void> _addProfileDetails(String userId) async {
    final data = {
      'achievements': achmtscontroller.text,
    };

    try {
      await _firestore
          .collection('profiledetails')
          .doc(userId)
          .collection('achievements')
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
                    "Achivements",
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
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 28.0, left: 18.0, right: 18.0),
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
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 18.0, left: 18.0, bottom: 18, right: 18),
                    child: TextField(
                      controller: achmtscontroller,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          hintText: 'Achivements',
                          labelText: 'Achivements:',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
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
                                    builder: (context) => Profile()));
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
