import 'package:flutter/material.dart';
import 'package:c_square2/constants.dart';
import 'package:c_square2/palette.dart';

class LoginBubble extends StatelessWidget {
  final Widget child;
  LoginBubble({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: kTextColor,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      width: 90,
      height: 50,
      child: child,
    );
  }
}
