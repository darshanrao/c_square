import 'package:flutter/material.dart';
import 'package:c_square2/palette.dart';
import 'file:///D:/AppDev/c_square/lib/Widgets/round_Button.dart';
import 'package:c_square2/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';

import 'list_view_screen.dart';

class SignUpScreen extends StatefulWidget {
  static String id = 'SignUp_Screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String password2;

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
              mainAxisSize: MainAxisSize.max,
              children: [
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
                    'Sign Up',
                    style: kHeaders,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Divider(
                    color: kDividerColor,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kTextColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  width: 90,
                  height: 300,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
                          ),
                        ),
                      ),
                      Container(
                        child: TextField(
                          obscureText: true,
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                          ),
                        ),
                      ),
                      Container(
                        child: TextField(
                          obscureText: true,
                          onChanged: (value) {
                            password2 = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                          ),
                        ),
                      ),
                      passError()
                          ? getMessage()
                          : Text('Password should at least have 6 Characters'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Hero(
                    tag: 'signup',
                    child: RoundedButton(
                      color: kDarkPrimaryColor,
                      text: 'Sign Up',
                      onPress: () async {
                        if (passError() != true) {
                          try {
                            final newUser =
                                _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            if (newUser != null) {
                              // Navigator.pop(context);
                              Navigator.pushNamed(context, LoginScreen.id);
                            }
                          } catch (e) {
                            print(e);
                          }
                        } else {
                          getMessage();
                        }
                      },
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

  bool passError() {
    bool passError;
    if (password != password2) {
      setState(() {
        passError = true;
      });
    } else {
      passError = false;
    }
    return passError;
  }

  Text getMessage() {
    return Text(
      'Passwords do not match',
      style: TextStyle(color: Colors.red),
    );
  }
}
