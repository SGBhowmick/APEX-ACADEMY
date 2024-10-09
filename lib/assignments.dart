import 'dart:convert'; // For JSON encoding and decoding
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectfinal/studentnotsubmitted.dart';
import 'package:projectfinal/studentsubmitted.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Assignments extends StatefulWidget {
  const Assignments({super.key});

  @override
  State<Assignments> createState() => _AssignmentsState();
}

class _AssignmentsState extends State<Assignments> {
  List<Map<String, dynamic>> _assignments = [];
  String currentDate =
      DateFormat.MMMd().format(DateTime.now()); // Use current date format

  @override
  void initState() {
    super.initState();
    _loadAssignments();
  }

  // Load assignments from SharedPreferences
  Future<void> _loadAssignments() async {
    final prefs = await SharedPreferences.getInstance();
    final String? assignmentsJson = prefs.getString('assignments');

    if (assignmentsJson != null) {
      final List<dynamic> assignmentsList = jsonDecode(assignmentsJson);
      setState(() {
        _assignments =
            assignmentsList.map((e) => Map<String, dynamic>.from(e)).toList();
      });
    } else {
      _assignments = [
        {
          'date': currentDate,
          'title': 'Science role in modern warfare',
          'deadline': 'Nov 14, 12:30 PM',
          'grade': '',
          'status': 'Not Submitted',
        },
        {
          'date': currentDate,
          'title': 'Science role in modern warfare',
          'deadline': 'Nov 14, 12:30 PM',
          'grade': '',
          'status': 'Submitted',
        },
      ];
      print(_assignments);
      _saveAssignments();
    }
  }

  // Save assignments to SharedPreferences
  Future<void> _saveAssignments() async {
    final prefs = await SharedPreferences.getInstance();
    final String assignmentsJson = jsonEncode(_assignments);
    await prefs.setString('assignments', assignmentsJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 14,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Jan- 2024",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Handle forward navigation
                  },
                  child: Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: ListView.builder(
                itemCount: _assignments.length,
                itemBuilder: (BuildContext context, int index) {
                  final assignment = _assignments[index];
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            if (assignment['status'] == 'Not Submitted') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SocialSubmitted())); // Ensure this is correct
                            } else if (assignment['status'] == 'Submitted') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          notSubmitted())); // Ensure this is correct
                            }
                          },
                          child: Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(assignment['date']),
                                  Text(
                                    assignment['title'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Deadline"),
                                          Text(assignment['deadline']),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Grade"),
                                          Text(
                                            assignment['grade'] ?? 'N/A',
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Status"),
                                          Text(
                                            assignment['status'],
                                            style: TextStyle(
                                              color: assignment['status'] ==
                                                      'Submitted'
                                                  ? Colors.green
                                                  : Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
