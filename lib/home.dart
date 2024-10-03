import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectfinal/ChatPage.dart';
import 'package:projectfinal/notification.dart';
import 'package:projectfinal/profile.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? _profilePicUrl = '';

  @override
  void initState() {
    super.initState();
    _loadProfilePic();
  }

  Future<void> _loadProfilePic() async {
    String userId = '1yRPk63zD3oNq8OXh6wJ';
    try {
      DocumentSnapshot doc =
          await _firestore.collection('profiledetails').doc(userId).get();
      if (doc.exists && doc.data() != null) {
        setState(() {
          _profilePicUrl = doc['profilepic'] as String?;
        });
      }
    } catch (e) {
      print('Error loading profile picture: $e');
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 248, 247, 247),
        title: Row(
          children: [
            Text(
              'apex academia',
              style: GoogleFonts.quicksand(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0),
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
                            MaterialPageRoute(builder: (context) => notiftn()),
                          );
                        },
                        child: Stack(
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
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profile()),
                          );
                        },
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(_profilePicUrl!),
                          radius: 20,
                        ),
                      ),
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
                                            color:
                                                Color.fromARGB(255, 96, 95, 95),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: IconButton(
                                color: Color.fromARGB(255, 176, 150, 6),
                                iconSize: 30,
                                onPressed: () {},
                                icon: Icon(Icons.arrow_circle_right_outlined),
                              ),
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
                  context, MaterialPageRoute(builder: (context) => ChatPage()));
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
