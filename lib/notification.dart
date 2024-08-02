import 'package:flutter/material.dart';
import 'package:projectfinal/homepage.dart';

class notiftn extends StatefulWidget {
  const notiftn({super.key});

  @override
  State<notiftn> createState() => _notiftnState();
}

class _notiftnState extends State<notiftn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => homepagestudent()));
                },
                icon: Icon(
                  Icons.arrow_back_sharp,
                  size: 25,
                )),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.grey.shade100,
            elevation: 0,
            title: const Text('Notification',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500))));
  }
}
