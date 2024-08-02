import 'package:flutter/material.dart';
import 'package:projectfinal/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Addressinfo extends StatefulWidget {
  const Addressinfo({super.key});

  @override
  State<Addressinfo> createState() => _AddressinfoState();
}

class _AddressinfoState extends State<Addressinfo> {
  var adrescontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addrstring();
  }

  void addrstring() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String address = adrescontroller.text;
    sharedPreferences.setString('address', address);
    print('address');
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
                    "Address",
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
                      controller: adrescontroller,
                      decoration: InputDecoration(
                          hintText: 'Address',
                          labelText: 'Address:',
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
                          onPressed: () {
                            addrstring();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile(
                                          adrs: adrescontroller.text,
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
