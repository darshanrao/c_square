import 'package:flutter/material.dart';
import 'package:c_square2/Widgets/round_Button.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function onPress;
  RoundedButton({this.color, this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
