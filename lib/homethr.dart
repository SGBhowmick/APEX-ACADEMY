import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectfinal/Studentlist.dart';
import 'package:projectfinal/chatpagethr.dart';
import 'package:projectfinal/notification.dart';

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
        title: Text(
          'apex academia',
          style: GoogleFonts.quicksand(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 23),
            child: Row(
              children: [
                IconButton(
                  icon: Stack(
                    children: [
                      Icon(Icons.notifications_none_outlined, size: 30),
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
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => notiftn()),
                    );
                  },
                ),
                SizedBox(width: 18),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Studentlist()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1,
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      "Students",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 248, 247, 247),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Text(
                    "Upcoming works",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
                          color: Color.fromARGB(255, 220, 219, 219),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://img.freepik.com/premium-photo/heavy-book-globe-background_488220-923.jpg'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  height: double.infinity,
                                  width: 70,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Social',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.amber,
                                      ),
                                    ),
                                    Text(
                                      'Case study project',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Prepare for the session',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(255, 96, 95, 95),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              color: Color.fromARGB(255, 176, 150, 6),
                              iconSize: 30,
                              onPressed: () {},
                              icon: Icon(Icons.arrow_circle_right_outlined),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Text(
                    "Daily Learning",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, realIndex) {
                return Padding(
                    padding:
                        const EdgeInsets.only(right: 0, bottom: 18, left: 18.0),
                    child: Container(
                      transform: Matrix4.translationValues(-460 / 4, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment
                                .bottomCenter, // Gradient starts from the bottom
                            end:
                                Alignment.topCenter, // Gradient ends at the top
                            colors: [
                              Colors.black.withOpacity(
                                  .9), // Black with some transparency
                              Colors.transparent, // Transparent at the top
                            ],
                            stops: [
                              0.0,
                              1.0
                            ], // Stops where each color should be applied
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                subjects[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
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
              ),
            ),
          ],
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPagethrs()),
              );
            },
            child: ImageIcon(
              AssetImage("assets/icons/messageicon.png"),
              size: 28,
            ),
          ),
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
