import 'package:flutter/material.dart';
import 'package:projectfinal/selectedsubjectpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class socialnotsubmited extends StatefulWidget {
  const socialnotsubmited({super.key});

  @override
  State<socialnotsubmited> createState() => _socialnotsubmitedState();
}

class _socialnotsubmitedState extends State<socialnotsubmited> {
  String statusdata = "Not Submitted";
  List<String> _fileUrls = [];

  void submitdata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String submitornot = statusdata;
    sharedPreferences.setString('subdata', submitornot);
    print(submitornot);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Selectedsubjectpage()));
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Color.fromARGB(255, 229, 224, 172),
        title: const Text('Social role in modern',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
      ),
      body: Stack(
        children: [
          Positioned(
            child: Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 229, 224, 172),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Positioned(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, right: 20, left: 20, bottom: 10),
                    child: Container(
                      height: 110,
                      child: Row(
                        children: [
                          Container(
                              width: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12)),
                                color: Color.fromARGB(255, 196, 165, 74),
                              )),
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
                                            fontSize: 14, color: Colors.green),
                                      ),
                                      Text(
                                        "Science Role in modern warfare",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text("10.30"),
                                      Text("Nov 17")
                                    ],
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: _fileUrls.isEmpty
                        ? Center(child: Text('No files uploaded yet.'))
                        : ListView.builder(
                            itemCount: _fileUrls.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Icon(Icons.file_copy),
                                title: Text('File ${index + 1}'),
                                subtitle: Text(_fileUrls[index]),
                                onTap: () {
                                  // Display file
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content:
                                          Text('PDF URL: ${_fileUrls[index]}'),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                  ),
                ],
              ),
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Expanded(
              child: SizedBox(
                height: 70,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel",
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                          side: BorderSide(
                              color: Color.fromARGB(255, 172, 142, 52)))),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    )),
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Expanded(
              child: SizedBox(
                height: 70,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        submitdata();
                        statusdata = 'Submitted';
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Selectedsubjectpage()));
                    },
                    child: Text(
                      "Upload",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3))),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 196, 165, 74)),
                    )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
