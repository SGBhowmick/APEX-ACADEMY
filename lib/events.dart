import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// ignore: must_be_immutable
class Events extends StatefulWidget {
  Events({super.key});
  String? title;
  Random random = Random();

  @override
  EventsState createState() => EventsState();
}

class EventsState extends State<Events> {
  final CalendarDataSource _dataSource = _DataSource(<Appointment>[]);
  final List<String> _subjectCollection = <String>[];
  final List<String> _eventsCollection = <String>[];
  final List<DateTime> _startTimeCollection = <DateTime>[];
  final List<DateTime> _endTimeCollection = <DateTime>[];
  List<TimeRegion> _specialTimeRegion = <TimeRegion>[];

  String dateInput = "${DateFormat.MMMEd().format(DateTime.now())}";

  @override
  void initState() {
    _getSubjectCollection();
    _getStartTimeCollection();
    _getEndTimeCollection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          title: const Text('Events',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 18, left: 18, top: 18),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Column(
                    children: [
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 14.0, left: 14.0, right: 14, bottom: 8),
                          child: Text("select date"),
                        )
                      ]),
                      Row(
                        children: [
                          Expanded(
                              child: Text(dateInput,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500))),
                          IconButton(
                            onPressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: const Color.fromARGB(
                                              255, 148, 121, 38),
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                              foregroundColor: Colors.black),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                print(pickedDate);
                                String formattedDate =
                                    DateFormat.MMMEd().format(pickedDate);
                                print(formattedDate);
                                setState(() {
                                  dateInput = formattedDate;
                                });
                              } else {}
                            },
                            icon: const Icon(Icons.mode_edit_outlined),
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Expanded(
                  child: SfCalendar(
                    appointmentBuilder: (context, calendarAppointmentDetails) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 230, 229, 229))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 6.0, left: 8.0, right: 8.0, bottom: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  "${_subjectCollection[widget.random.nextInt(9)]}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "${_eventsCollection[widget.random.nextInt(9)]}",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    initialDisplayDate: DateTime.now(),
                    controller: CalendarController(),
                    selectionDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(28)),
                        border: Border.all(
                            color: const Color.fromARGB(255, 163, 132, 19),
                            width: 2)),
                    viewNavigationMode: ViewNavigationMode.snap,
                    monthViewSettings: MonthViewSettings(
                        navigationDirection:
                            MonthNavigationDirection.horizontal,
                        appointmentDisplayMode:
                            MonthAppointmentDisplayMode.indicator,
                        showAgenda: true,
                        showTrailingAndLeadingDates: false,
                        monthCellStyle: MonthCellStyle(
                          backgroundColor: Colors.white,
                        ),
                        agendaStyle: AgendaStyle(
                            dayTextStyle: TextStyle(),
                            backgroundColor: Colors.white,
                            appointmentTextStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ))),
                    dataSource: _dataSource,
                    view: CalendarView.month,
                    headerHeight: 70,
                    backgroundColor: Colors.white,
                    viewHeaderStyle: ViewHeaderStyle(
                        backgroundColor: Colors.white,
                        dayTextStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    headerStyle: CalendarHeaderStyle(
                        backgroundColor: Colors.white,
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    showNavigationArrow: true,
                    allowDragAndDrop: true,
                    showDatePickerButton: true,
                    cellBorderColor: Colors.white,
                    todayHighlightColor: Color.fromARGB(255, 176, 150, 6),
                    onViewChanged: viewChanged,
                    specialRegions: _specialTimeRegion,
                    allowAppointmentResize: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void viewChanged(ViewChangedDetails viewChangedDetails) {
    List<DateTime> visibleDates = viewChangedDetails.visibleDates;
    List<TimeRegion> timeRegion = <TimeRegion>[];
    List<Appointment> appointments = <Appointment>[];
    _dataSource.appointments!.clear();

    for (int i = 0; i < visibleDates.length; i++) {
      if (visibleDates[i].weekday == 6 || visibleDates[i].weekday == 7) {
        continue;
      }
      timeRegion.add(TimeRegion(
          startTime: DateTime(visibleDates[i].year, visibleDates[i].month,
              visibleDates[i].day, 13, 0, 0),
          endTime: DateTime(visibleDates[i].year, visibleDates[i].month,
              visibleDates[i].day, 14, 0, 0),
          text: 'Break',
          enablePointerInteraction: false));
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          _specialTimeRegion = timeRegion;
        });
      });
      for (int j = 0; j < _startTimeCollection.length; j++) {
        DateTime startTime = DateTime(
            visibleDates[i].year,
            visibleDates[i].month,
            visibleDates[i].day,
            _startTimeCollection[j].hour,
            _startTimeCollection[j].minute,
            _startTimeCollection[j].second);
        DateTime endTime = DateTime(
            visibleDates[i].year,
            visibleDates[i].month,
            visibleDates[i].day,
            _endTimeCollection[j].hour,
            _endTimeCollection[j].minute,
            _endTimeCollection[j].second);

        appointments.add(Appointment(
            startTime: startTime,
            endTime: endTime,
            color: const Color.fromARGB(255, 174, 139, 32)));
      }
    }
    for (int i = 0; i < appointments.length; i++) {
      _dataSource.appointments!.add(appointments[i]);
    }
    _dataSource.notifyListeners(
        CalendarDataSourceAction.reset, _dataSource.appointments!);
  }

  void _getSubjectCollection() {
    _subjectCollection.add('General Meeting');
    _subjectCollection.add('Plan Execution');
    _subjectCollection.add('Project Plan');
    _subjectCollection.add('Consulting');
    _subjectCollection.add('Support');
    _subjectCollection.add('Development Meeting');
    _subjectCollection.add('Scrum');
    _subjectCollection.add('Project Completion');
    _subjectCollection.add('Release updates');
    _subjectCollection.add('Performance Check');
    _eventsCollection.add('Event');
    _eventsCollection.add('Holiday');
    _eventsCollection.add('Event');
    _eventsCollection.add('Holiday');
    _eventsCollection.add('Event');
    _eventsCollection.add('Holiday');
    _eventsCollection.add('Event');
    _eventsCollection.add('Holiday');
    _eventsCollection.add('Event');
    _eventsCollection.add('Holiday');
  }

  void _getStartTimeCollection() {
    var currentDateTime = DateTime.now();
    _startTimeCollection.add(DateTime(currentDateTime.year,
        currentDateTime.month, currentDateTime.day, 9, 0, 0));
    _startTimeCollection.add(DateTime(currentDateTime.year,
        currentDateTime.month, currentDateTime.day, 10, 0, 0));
    _startTimeCollection.add(DateTime(currentDateTime.year,
        currentDateTime.month, currentDateTime.day, 11, 0, 0));
    _startTimeCollection.add(DateTime(currentDateTime.year,
        currentDateTime.month, currentDateTime.day, 12, 0, 0));
    _startTimeCollection.add(DateTime(currentDateTime.year,
        currentDateTime.month, currentDateTime.day, 14, 0, 0));
    _startTimeCollection.add(DateTime(currentDateTime.year,
        currentDateTime.month, currentDateTime.day, 15, 0, 0));
    _startTimeCollection.add(DateTime(currentDateTime.year,
        currentDateTime.month, currentDateTime.day, 16, 0, 0));
    _startTimeCollection.add(DateTime(currentDateTime.year,
        currentDateTime.month, currentDateTime.day, 17, 0, 0));
    _startTimeCollection.add(DateTime(currentDateTime.year,
        currentDateTime.month, currentDateTime.day, 18, 0, 0));
  }

  void _getEndTimeCollection() {
    var currentDateTime = DateTime.now();
    _endTimeCollection.add(DateTime(currentDateTime.year, currentDateTime.month,
        currentDateTime.day, 10, 0, 0));
    _endTimeCollection.add(DateTime(currentDateTime.year, currentDateTime.month,
        currentDateTime.day, 11, 0, 0));
    _endTimeCollection.add(DateTime(currentDateTime.year, currentDateTime.month,
        currentDateTime.day, 12, 0, 0));
    _endTimeCollection.add(DateTime(currentDateTime.year, currentDateTime.month,
        currentDateTime.day, 13, 0, 0));
    _endTimeCollection.add(DateTime(currentDateTime.year, currentDateTime.month,
        currentDateTime.day, 15, 0, 0));
    _endTimeCollection.add(DateTime(currentDateTime.year, currentDateTime.month,
        currentDateTime.day, 16, 0, 0));
    _endTimeCollection.add(DateTime(currentDateTime.year, currentDateTime.month,
        currentDateTime.day, 17, 0, 0));
    _endTimeCollection.add(DateTime(currentDateTime.year, currentDateTime.month,
        currentDateTime.day, 18, 0, 0));
    _endTimeCollection.add(DateTime(currentDateTime.year, currentDateTime.month,
        currentDateTime.day, 19, 0, 0));
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
