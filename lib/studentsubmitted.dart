import 'dart:io';
import 'package:file_icon/file_icon.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:projectfinal/selectedsubjectpage.dart';
import 'package:projectfinal/studentnotsubmitted.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SocialSubmitted extends StatefulWidget {
  const SocialSubmitted({Key? key}) : super(key: key);

  @override
  State<SocialSubmitted> createState() => _SocialSubmittedState();
}

class _SocialSubmittedState extends State<SocialSubmitted> {
  List<File> _files = [];
  String subjects = '';

  @override
  void initState() {
    super.initState();
    _selectedSubject();
  }

  Future<void> _selectedSubject() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      subjects = prefs.getString('subject') ?? '';
    });
  }

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.paths.isNotEmpty) {
      setState(() {
        _files = result.paths.map((path) => File(path!)).toList();
      });
    }
  }

  Future<void> _uploadFiles() async {
    if (_files.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No files selected to upload.')),
      );
      return;
    }

    FirebaseStorage storage = FirebaseStorage.instance;
    List<String> urls = [];

    for (File file in _files) {
      try {
        String fileName = DateTime.now().millisecondsSinceEpoch.toString() +
            '-' +
            file.uri.pathSegments.last;

        Reference ref =
            storage.ref().child('uploads/$subjects/assignments/$fileName');

        UploadTask uploadTask = ref.putFile(file);
        TaskSnapshot snapshot = await uploadTask;

        String downloadUrl = await snapshot.ref.getDownloadURL();
        urls.add(downloadUrl);
      } catch (e) {
        print('Error uploading file: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error uploading file: $e')),
        );
      }
    }

    await _saveFileUrls(urls); // Save URLs to SharedPreferences

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Files uploaded successfully.')),
    );
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => notSubmitted()),
      );
    });
  }

  Future<void> _saveFileUrls(List<String> urls) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('uploaded_file_urls', urls);
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
              MaterialPageRoute(builder: (context) => SelectedSubjectPage()),
            );
          },
        ),
        backgroundColor: Color.fromARGB(255, 229, 224, 172),
        title: const Text(
          'Social Role in Modern',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          // Preview Section
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
                      margin: EdgeInsets.symmetric(horizontal: 18),
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
                                        "Not Submitted",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.red,
                                        ),
                                      ),
                                      Text(
                                        "Science Role in Modern Warfare",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text("10:30"),
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
          if (_files.isEmpty)
            Center(child: Text("No files uploaded yet"))
          else
            Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected PDFs:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      itemCount: _files.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              FileIcon(_files[index].path.split('/').last),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  _files[index].path.split('/').last,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: SizedBox(
                  height: 70,
                  child: ElevatedButton(
                    onPressed: _pickFiles,
                    child: Text(
                      "Select PDFs",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                          side: BorderSide(
                            color: Color.fromARGB(255, 172, 142, 52),
                          ),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: SizedBox(
                  height: 70,
                  child: ElevatedButton(
                    onPressed: _uploadFiles,
                    child: Text(
                      "Upload",
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
