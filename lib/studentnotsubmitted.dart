import 'package:file_icon/file_icon.dart';
import 'package:flutter/material.dart';
import 'package:projectfinal/selectedsubjectpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class notSubmitted extends StatefulWidget {
  const notSubmitted({super.key});

  @override
  State<notSubmitted> createState() => _notSubmittedState();
}

class _notSubmittedState extends State<notSubmitted> {
  List<String> _fileUrls = []; // List to store URLs of the uploaded files

  @override
  void initState() {
    super.initState();
    _loadFileUrls(); // Load URLs from SharedPreferences when the widget initializes
  }

  Future<void> _loadFileUrls() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _fileUrls = prefs.getStringList('uploaded_file_urls') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Selectedsubjectpage()),
            );
          },
        ),
        backgroundColor: Color.fromARGB(255, 229, 224, 172),
        title: const Text(
          'Social role in modern',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 229, 224, 172),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 18, right: 18),
                      height: 110,
                      child: Center(
                        child: Row(
                          children: [
                            Container(
                              width: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                                color: Color.fromARGB(255, 196, 165, 74),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 14.0, top: 10, bottom: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Submitted",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green,
                                        ),
                                      ),
                                      Text(
                                        "Science Role in modern warfare",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text("10.30"),
                                      Text("Nov 17"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Updated ListView to display uploaded file URLs
          Expanded(
            child: _fileUrls.isEmpty
                ? Center(child: Text('No files uploaded yet.'))
                : ListView.builder(
                    padding: EdgeInsets.only(top: 8, left: 20, right: 20),
                    itemCount: _fileUrls.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: ListTile(
                          tileColor: Colors.blueGrey[50],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          leading: FileIcon(_fileUrls[index]
                              .split('%')
                              .last
                              .split('?')
                              .first),
                          title: Text('File ${index + 1}'),
                          subtitle: Text(_fileUrls[index]
                              .split('%')
                              .last
                              .split('?')
                              .first),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Text('FILE URL: ${_fileUrls[index]}'),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: SizedBox(
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Selectedsubjectpage(),
                        ),
                      );
                    },
                    child: Text(
                      "Done",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 196, 165, 74),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
