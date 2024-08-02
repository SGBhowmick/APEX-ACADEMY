import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Attendence extends StatefulWidget {
  const Attendence({super.key});

  @override
  State<Attendence> createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: AppBar(
            backgroundColor: Colors.grey[100],
            elevation: 0,
            automaticallyImplyLeading: false,
            title: const Text('Leave & Attendence',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
          ),
        ),
        body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(23))),
                      child: Padding(
                        padding: const EdgeInsets.all(5.5),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Jan- 2024",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(23))),
                      child: Padding(
                        padding: const EdgeInsets.all(5.5),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: double.infinity,
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Card(
                          color: Color.fromARGB(255, 230, 226, 183),
                          shadowColor: Colors.black,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 12.0, top: 12),
                                  child: Text("Full days",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ),
                                Text("10",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                Text("Days",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16))
                              ]),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Card(
                          color: Color.fromARGB(255, 230, 226, 183),
                          shadowColor: Colors.black,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 12.0, top: 12),
                                  child: Text("Half days",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ),
                                Text("0",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                Text("Days",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16))
                              ]),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Card(
                          color: Color.fromARGB(255, 230, 226, 183),
                          shadowColor: Colors.black,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 12.0, top: 12),
                                  child: Text("Total days",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ),
                                Text("10",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                Text("Days",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16))
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      right: 23.0, left: 23, bottom: 10, top: 20),
                  child: ExpansionTile(
                      collapsedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(color: Colors.grey.shade300)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      collapsedBackgroundColor: Colors.white,
                      backgroundColor: Colors.white,
                      title: Text('My Calender',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400)),
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: TableCalendar(
                                      headerVisible: true,
                                      headerStyle: HeaderStyle(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors
                                                          .grey.shade300))),
                                          titleCentered: true,
                                          formatButtonVisible: false,
                                          leftChevronIcon: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(23))),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.5,
                                                    right: 4,
                                                    bottom: 5.5,
                                                    left: 6.5),
                                                child: Icon(
                                                  Icons.arrow_back_ios,
                                                  size: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                          rightChevronIcon: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(23))),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.5,
                                                    right: 4,
                                                    bottom: 5.5,
                                                    left: 6.5),
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 14,
                                                ),
                                              ),
                                            ),
                                          )),
                                      shouldFillViewport: true,
                                      firstDay: DateTime.utc(2010, 10, 20),
                                      lastDay: DateTime.utc(2040, 10, 20),
                                      focusedDay: _focusedDay,
                                      calendarFormat: CalendarFormat.month,
                                      calendarStyle: CalendarStyle(
                                          tablePadding: EdgeInsets.only(
                                              left: 40, right: 40),
                                          todayDecoration: BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle,
                                          ),
                                          selectedTextStyle:
                                              TextStyle(color: Colors.black),
                                          selectedDecoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border:
                                                Border.all(color: Colors.blue),
                                          ),
                                          todayTextStyle:
                                              TextStyle(color: Colors.white),
                                          weekendTextStyle:
                                              TextStyle(color: Colors.red)),
                                      currentDay: DateTime.now(),
                                      selectedDayPredicate: (day) {
                                        return isSameDay(_selectedDay, day);
                                      },
                                      onDaySelected: (selectedDay, focusedDay) {
                                        if (!isSameDay(
                                            _selectedDay, selectedDay)) {
                                          setState(() {
                                            _selectedDay = selectedDay;
                                            _focusedDay = focusedDay;
                                          });
                                        }
                                      },
                                      onPageChanged: (focusedDay) {
                                        _focusedDay = focusedDay;
                                      },
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.grey.shade300))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0,
                                          bottom: 10.0,
                                          left: 18,
                                          right: 18),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Wrap(
                                              children: [
                                                CircleAvatar(
                                                  radius: 13,
                                                  backgroundColor: Colors.green,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Present",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Wrap(
                                              children: [
                                                CircleAvatar(
                                                  radius: 13,
                                                  backgroundColor: Colors.red,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Absent",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Wrap(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 4.0, right: 8),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.blue),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    23))),
                                                    child: CircleAvatar(
                                                      radius: 13,
                                                      backgroundColor:
                                                          Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 6),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Holiyday/",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        "Weekoff",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ])),
              Padding(
                  padding: const EdgeInsets.only(
                      right: 23.0, left: 23, bottom: 10, top: 10),
                  child: ExpansionTile(
                      collapsedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(color: Colors.grey.shade300)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      collapsedBackgroundColor: Colors.white,
                      backgroundColor: Colors.white,
                      title: Text('Apply Leave',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400)),
                      children: [])),
              Padding(
                  padding: const EdgeInsets.only(
                      right: 23.0, left: 23, bottom: 10, top: 10),
                  child: ExpansionTile(
                      collapsedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(color: Colors.grey.shade300)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      collapsedBackgroundColor: Colors.white,
                      backgroundColor: Colors.white,
                      title: Text('Upcoming Holidays',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400)),
                      children: []))
            ])));
  }
}
