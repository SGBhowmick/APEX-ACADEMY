import 'package:flutter/material.dart';
import 'package:projectfinal/selectedsubjectpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Records extends StatefulWidget {
  const Records({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  List<String> subjects = [
    "All",
    "English",
    "Malayalam",
    "Science",
    "Maths",
    "Physics",
    "Social",
    "Chemistry",
    "Computer",
    "Hindi",
    "Biology"
  ];

  Future<void> _savesub(String subject) async {
    SharedPreferences selectedSubject = await SharedPreferences.getInstance();
    selectedSubject.setString('subject', subject);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Records",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 18.0, bottom: 18.0, left: 10.0),
              child: Text(
                "Subjects",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: .1,
              ),
              physics:
                  NeverScrollableScrollPhysics(), // to disable GridView's scrolling
              shrinkWrap: true, // You won't see infinite size error
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _savesub(subjects[index]);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Selectedsubjectpage(
                            subject: subjects[index].toString(),
                          ),
                        ));
                  },
                  child: GridTile(
                      child: ListView(children: [
                    Center(
                      child: Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.yellow,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://wallpapers.com/images/hd/english-pictures-74yyrna61t7kmd9d.jpg"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Center(child: Text(subjects[index]))
                  ])),
                );
              },
            ),
            // ...... other list children.
          ],
        ),
      ),
    );
  }
}
