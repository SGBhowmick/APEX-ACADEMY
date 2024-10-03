import 'package:flutter/material.dart';
import 'package:projectfinal/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class page1 extends StatefulWidget {
  const page1({
    super.key,
  });

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  String selectedprofile = "";

  void _saveProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('sprofile', selectedprofile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'login as',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              height: 55,
              width: 250,
              child: ElevatedButton(
                  style: ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(
                          const Color.fromARGB(255, 233, 255, 208)),
                      surfaceTintColor: WidgetStatePropertyAll(Colors.orange),
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                      elevation: WidgetStatePropertyAll(3),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          side: BorderSide(
                              color: const Color.fromARGB(255, 227, 226, 226)),
                          borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {
                    setState(() {
                      selectedprofile = "teacher";
                      _saveProfile();
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  child: Text(
                    "TEACHER",
                    style: TextStyle(color: Colors.amber.shade800),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              height: 55,
              width: 250,
              child: ElevatedButton(
                  style: ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(
                          const Color.fromARGB(255, 233, 255, 208)),
                      surfaceTintColor: WidgetStatePropertyAll(Colors.orange),
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                      elevation: WidgetStatePropertyAll(3),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          side: BorderSide(
                              color: const Color.fromARGB(255, 227, 226, 226)),
                          borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {
                    setState(() {
                      selectedprofile = "student";
                      _saveProfile();
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  child: Text(
                    "STUDENT",
                    style: TextStyle(color: Colors.amber.shade800),
                  )),
            ),
          )
        ],
      ),
    ));
  }
}
