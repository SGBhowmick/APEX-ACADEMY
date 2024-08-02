import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectfinal/Studentlist.dart';
import 'package:projectfinal/chatpage.dart';
import 'package:projectfinal/notification.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData1 {
  ChartData1(this.y);
  final double y;
}

// ignore: must_be_immutable
class HomeTrs extends StatefulWidget {
  HomeTrs({super.key});

  @override
  State<HomeTrs> createState() => _HomeTrsState();
}

class _HomeTrsState extends State<HomeTrs> {
  final List<ChartData1> histogramData = <ChartData1>[
    ChartData1(0.0),
    ChartData1(100),
    ChartData1(0),
    ChartData1(50),
    ChartData1(0),
    ChartData1(70),
  ];

  List<String> subjects = [
    "Maths",
    "Physics",
    "Social",
    "Chemistry",
    "Biology",
    "Computer Science"
  ];
  List<String> images = [
    "https://www.teacheracademy.eu/wp-content/uploads/2021/07/Improving_teaching_styles.png",
    "https://dcblog.b-cdn.net/wp-content/uploads/2021/04/Online-Teaching-Methods-And-Pedagogy.jpg",
    "https://observatory.tec.mx/wp-content/uploads/2020/09/maestroprofesorinstructor.jpg",
    "https://blog.adobe.com/en/publish/2021/08/23/media_1f7dbb69e9034b801276b59d5595f881b71cac683.png?width=750&format=png&optimize=medium",
    "https://s39613.pcdn.co/wp-content/uploads/2020/01/illusion-of-good-class-discussions.jpg",
    "https://i.pinimg.com/736x/b4/84/91/b4849102d96a64bfa9d2523f69bcfa2b.jpg"
  ];
  var pimage =
      "https://media.istockphoto.com/id/1451587807/vector/user-profile-icon-vector-avatar-or-person-icon-profile-picture-portrait-symbol-vector.jpg?s=612x612&w=0&k=20&c=yDJ4ITX1cHMh25Lt1vI1zBn2cAKKAlByHBvPJ8gEiIg=";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 248, 247, 247),
        title: Row(
          children: [
            Title(
              color: Colors.black,
              child: Text('apex academia',
                  style: GoogleFonts.quicksand(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => notiftn()));
                        },
                        child: Stack(
                          children: [
                            Icon(
                              Icons.notifications_none_outlined,
                              size: 30,
                            ),
                            Positioned(
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 13,
                                  minHeight: 13,
                                ),
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Studentlist()));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Colors.grey.shade400, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 8.0, left: 8, top: 4, bottom: 4),
                            child: Text(
                              "Students",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 248, 247, 247),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4,
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SfCartesianChart(
                          loadMoreIndicatorBuilder: (context, int) =>
                              Text('hello'),
                          title: ChartTitle(
                              text: 'Daily Attendence',
                              borderWidth: Checkbox.width,
                              alignment: ChartAlignment.near,
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w600)),
                          series: <CartesianSeries>[
                            HistogramSeries<ChartData1, double>(
                                color: Color.fromARGB(255, 241, 227, 187),
                                dataSource: histogramData,
                                showNormalDistributionCurve: true,
                                curveColor: Color.fromARGB(255, 125, 94, 3),
                                enableTooltip: true,
                                binInterval: 40,
                                borderWidth: 0,
                                dataLabelMapper: (ChartData1 data, index) =>
                                    data.y.toString(),
                                yValueMapper: (ChartData1 data, _) => data.y)
                          ]),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(children: [
                  Text(
                    "Upcoming works",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: PageScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          height: 90,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 2,
                                  color: Color.fromARGB(255, 220, 219, 219)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://img.freepik.com/premium-photo/heavy-book-globe-background_488220-923.jpg'),
                                                fit: BoxFit.fill)),
                                        height: double.infinity,
                                        width: 70),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 30),
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Social',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.amber),
                                            ),
                                            Text(
                                              'Case study project',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              'Prepare for the session',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      255, 96, 95, 95)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                                  Container(
                                      child: Center(
                                    child: IconButton(
                                        color: Color.fromARGB(255, 176, 150, 6),
                                        iconSize: 30,
                                        onPressed: () {},
                                        icon: Icon(
                                            Icons.arrow_circle_right_outlined)),
                                  ))
                                ]),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(children: [
                  Text(
                    "Daily Learning",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  )
                ]),
              ),
              CarouselSlider.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index, realIndex) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          right: 0, bottom: 18, left: 18.0),
                      child: Container(
                        transform: Matrix4.translationValues(-460 / 4, 0, 0),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage("${images[index]}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${subjects[index]}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    scrollPhysics: PageScrollPhysics(),
                    height: 180,
                    viewportFraction: .38,
                    pageSnapping: true,
                    disableCenter: true,
                    animateToClosest: false,
                    initialPage: 0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 65,
          width: 65,
          child: FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 204, 175, 8),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => chatpage()));
              },
              child: ImageIcon(
                AssetImage("assets/icons/messageicon.png"),
                size: 28,
              )),
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
