import 'package:flutter/material.dart';

class MainMenuText extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Users",
        style: TextStyle(fontSize: 15),
        textAlign: TextAlign.left,
      ),
      margin: EdgeInsets.fromLTRB(20, 15, 0, 0),
    );
  }
}
