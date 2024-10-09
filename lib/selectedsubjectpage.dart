import 'package:flutter/material.dart';
import 'package:projectfinal/assignments.dart';
import 'package:projectfinal/homepage.dart';
import 'package:projectfinal/lab.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectedSubjectPage extends StatefulWidget {
  const SelectedSubjectPage({Key? key}) : super(key: key);

  @override
  State<SelectedSubjectPage> createState() => _SelectedSubjectPageState();
}

class _SelectedSubjectPageState extends State<SelectedSubjectPage> {
  String subjects = '';

  @override
  void initState() {
    super.initState();
    _getSelectedSubject();
  }

  Future<void> _getSelectedSubject() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      subjects = prefs.getString('subject') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_sharp, color: Colors.black),
            onPressed: () {
              Navigator.push(
                  (context),
                  MaterialPageRoute(
                      builder: (context) => homepagestudent(
                            initialIndex: 1,
                          ))); // Use pop to go back
            },
          ),
          backgroundColor: const Color.fromARGB(255, 229, 224, 172),
          title: Text(
            subjects,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 6,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
              indicatorColor: const Color.fromARGB(255, 158, 124, 20),
              tabs: const [
                Tab(
                  child: Text(
                    "Assignments",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Lab",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Assignments(),
            lab(),
          ],
        ),
      ),
    );
  }
}
