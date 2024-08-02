import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectfinal/homepage.dart';
import 'package:projectfinal/hometeacher.dart';

// ignore: must_be_immutable
class Loginpage extends StatefulWidget {
  Loginpage({super.key, required this.sprofile});
  String sprofile;
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool _isHidden = true;
  TextEditingController textctrlacdmy = TextEditingController();
  TextEditingController textctrlpwd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('apex academia',
                    style: GoogleFonts.quicksand(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
              ),
              Text('Log into your account'),
              Padding(
                padding: const EdgeInsets.only(
                    right: 23.0, left: 23, top: 33, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text('Academy Id'),
                    ),
                    TextField(
                      controller: textctrlacdmy,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 23.0, left: 23, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text('Password'),
                    ),
                    TextField(
                      controller: textctrlpwd,
                      obscureText: _isHidden,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: !_isHidden,
                          onChanged: (bool? value) {
                            setState(() {
                              _isHidden = !value!;
                            });
                          },
                        ),
                        Text("Show password")
                      ],
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 33.0, right: 23, left: 23, bottom: 5),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2))),
                          backgroundColor: WidgetStatePropertyAll(
                              Color.fromARGB(255, 214, 163, 10))),
                      onPressed: () {
                        if (widget.sprofile == "teacher") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => homepageteacher(),
                              ));
                        } else if (widget.sprofile == "student") {
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => homepagestudent(),
                                ));
                          }
                        } else {}
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Need Help?'),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Contact Us',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
