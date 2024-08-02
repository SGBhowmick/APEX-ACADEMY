import 'package:flutter/material.dart';
import 'package:projectfinal/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Contactinfo extends StatefulWidget {
  const Contactinfo({super.key});

  @override
  State<Contactinfo> createState() => _ContactinfoState();
}

class _ContactinfoState extends State<Contactinfo> {
  var emailcontroller = TextEditingController();
  var contactnum1controller = TextEditingController();
  var contactnum2controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Contactstring();
  }

  void Contactstring() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String email = emailcontroller.text;
    sharedPreferences.setString('email', email);
    String contactnum1 = contactnum1controller.text;
    sharedPreferences.setString('ctnum1', contactnum1);
    String contactnum2 = contactnum2controller.text;
    sharedPreferences.setString('ctnum2', contactnum2);
    print(email);
    print(contactnum1);
    print(contactnum2);
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
                    "Contact Information",
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
                      keyboardType: TextInputType.emailAddress,
                      controller: emailcontroller,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email:',
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
                              top: 8.0, left: 18.0, bottom: 28, right: 18),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: contactnum1controller,
                            decoration: InputDecoration(
                                hintText: 'Contact Number',
                                labelText: 'Contact Number:',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, right: 18.0, bottom: 28, left: 10),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: contactnum2controller,
                            decoration: InputDecoration(
                                hintText: 'Contact Number 2',
                                labelText: 'Contact Number 2:',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                          ),
                        ),
                      ),
                    ],
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
                          onPressed: () {
                            Contactstring();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile(
                                          cnum1: contactnum1controller.text,
                                          cnum2: contactnum2controller.text,
                                          email: emailcontroller.text,
                                        )));
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