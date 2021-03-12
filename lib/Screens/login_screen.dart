import 'package:c_square2/Screens/home_screen.dart';
import 'package:c_square2/auth.dart';
import 'package:flutter/material.dart';
import 'package:c_square2/palette.dart';
import 'file:///D:/AppDev/c_square/lib/Widgets/round_Button.dart';
import 'package:c_square2/constants.dart';
import 'package:c_square2/Widgets/login_Bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'Login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 100,
                ),
                Hero(
                  tag: 'logo',
                  child: Image(
                    width: 100,
                    height: 100,
                    image: AssetImage('images/Corona.png'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'Log In',
                    style: kHeaders,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Divider(
                    color: kDividerColor,
                  ),
                ),
                LoginBubble(
                  child: TextField(
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 5, top: 15),
                      hintText: "Email",
                    ),
                  ),
                ),
                LoginBubble(
                  child: TextField(
                    obscureText: true,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 5, top: 15),
                      hintText: "Password",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Hero(
                    tag: 'login',
                    child: RoundedButton(
                      color: kDarkPrimaryColor,
                      text: 'Log In',
                      onPress: () => signin(email, password, context)
                          .whenComplete(() =>
                              Navigator.pushNamed(context, HomeScreen.id)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
