import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';
import 'package:c_square2/palette.dart';
import 'package:c_square2/Screens/welcome_screen.dart';
import 'home_screen.dart';

//import 'package:intro_slider_example/home.dart';

class IntroScreen extends StatefulWidget {
  static String id = 'Intro_Screen';
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();
    slides.add(
      new Slide(
        title: "Welcome",
        description:
            " Hi there! Welcome to C-square, we here tried to keep every possible way of data representation of the current pandemic on the table. In the following few slides we will brief you about the same",
        pathImage: "images/Corona.png",
        backgroundColor: kDarkPrimaryColor,
      ),
    );
    slides.add(
      new Slide(
        title: "Tables",
        description:
            "All of the global data wrapped into one systematic format to provide you with the most authentic information present out there in a much user-oriented manner",
        pathImage: "images/Tables.png",
        backgroundColor: kLightPrimaryColor,
      ),
    );

    slides.add(
      new Slide(
        title: "Graph",
        description:
            "The figures and statistics are pushed through various mathematical formulas and sprinkled with some amazing animated front end to provide you the best user experience and application interface we could",
        pathImage: "images/Charts.png",
        backgroundColor: kDarkPrimaryColor,
      ),
    );
    slides.add(
      new Slide(
        title: "Map",
        description:
            "One of the best features of ours that you will experience is the dynamic world wide map loaded with varieties of markers deployed according to the statistics so that the user could visualize all of the data in the best way present out there",
        pathImage: "images/Map.png",
        backgroundColor: kLightPrimaryColor,
      ),
    );
    slides.add(
      new Slide(
        title: "Website",
        description:
            "For the sake of PC users, we have replicated the entire application in the form of website and it's live on the web, do check it out at https://csquare.ga/",
        pathImage: "images/Website.png",
        backgroundColor: kDarkPrimaryColor,
      ),
    );
    slides.add(
      new Slide(
        title: "Stay Safe",
        description:
            "This global pandemic had put us through the worst times ever. Humanity has never faced such a massive health and financial hit. But all of us here at C-Square believe if we stand together, we could surpass this time and make it out. We hope the best for you, stay safe, stay healthy",
        pathImage: "images/Mask.png",
        backgroundColor: kLightPrimaryColor,
      ),
    );
  }

  void onDonePress() {
    Navigator.pushNamed(context, WelcomeScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}
