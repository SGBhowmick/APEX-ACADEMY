import 'package:flutter/material.dart';
import 'package:projectfinal/selectedrecordstrs.dart';

class Recordstrs extends StatefulWidget {
  const Recordstrs({super.key});

  @override
  State<Recordstrs> createState() => _RecordstrsState();
}

class _RecordstrsState extends State<Recordstrs> {
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Selectedrecordstrs(),
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
          ],
        ),
      ),
    );
  }
}
