import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextCard extends StatelessWidget {
  final String heading;
  final String text;
  final String trailing;
  final Color color;
  TextCard({this.heading, this.text, this.color, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(heading),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text != null ? text : 'Loading',
              style: TextStyle(
                  fontSize: 16, color: color, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                trailing != ''
                    ? Icon(
                        FontAwesomeIcons.arrowUp,
                        color: color,
                        size: 16,
                      )
                    : Text(''),
                Text(trailing, style: TextStyle(color: color)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
