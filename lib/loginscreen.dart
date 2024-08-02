import 'package:flutter/material.dart';
import 'package:projectfinal/loginpage.dart';

class page1 extends StatefulWidget {
  const page1({
    super.key,
  });

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  var selectedprofile = "";
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
                      elevation: WidgetStatePropertyAll(4),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          side: BorderSide(
                              color: const Color.fromARGB(255, 227, 226, 226)),
                          borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {
                    setState(() {
                      selectedprofile = "teacher";
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Loginpage(
                            sprofile: selectedprofile,
                          ),
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
                      elevation: WidgetStatePropertyAll(4),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          side: BorderSide(
                              color: const Color.fromARGB(255, 227, 226, 226)),
                          borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {
                    setState(() {
                      selectedprofile = "student";
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Loginpage(
                            sprofile: selectedprofile,
                          ),
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
