import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:c_square2/palette.dart';

class AboutUsScreen extends StatelessWidget {
  static String id = 'About_Us_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'OUR',
                            style: TextStyle(
                              fontSize: 50,
                              color: kExtraDarkPrimaryColor,
                              fontFamily: 'Product Black',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'TEAM',
                            style: TextStyle(
                              fontSize: 50,
                              color: kExtraDarkPrimaryColor,
                              fontFamily: 'Product Black',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Image(
                      width: 200,
                      height: 200,
                      image: AssetImage('images/Team.png'),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 200,
                width: 390,
                decoration: BoxDecoration(
                  color: kExtraDarkPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(200),
                    bottomRight: Radius.circular(200),
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'App Developer',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Hey!I am Darshan and I\'m 19.Completed two years of computer science B.Tech course, two more to go.I\'ve got my hands on app development and I enjoy watching anime.',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 180.0,
                      height: 180.0,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('images/dashy.jpeg'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image(
                width: 200,
                height: 200,
                image: AssetImage('images/Software.png'),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 200,
                width: 390,
                decoration: BoxDecoration(
                  color: kExtraDarkPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                    bottomLeft: Radius.circular(200),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 180.0,
                      height: 180.0,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('images/bapu.jpeg'),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Designer',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 2),
                          child: Container(
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Hello!I am Anuj and I\'m 19.Currently pursuing computer engineering.I\'ve got my major interests in vector art and creating unique illustrations.',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image(
                width: 200,
                height: 200,
                image: AssetImage('images/Design.png'),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 210,
                width: 390,
                decoration: BoxDecoration(
                  color: kExtraDarkPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(210),
                    bottomRight: Radius.circular(210),
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Web Developer',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Hi there!I am Kaustubh and I\'m 19.Currently in second year of my Bachelor of Technology (B.Tech) course in computer science.I\'ve been into web development for quite a good time now',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 180.0,
                      height: 180.0,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('images/zoro.jpeg'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image(
                width: 200,
                height: 200,
                image: AssetImage('images/Database.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
