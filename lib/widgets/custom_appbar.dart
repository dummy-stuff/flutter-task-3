import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  // @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(5.0) //
            ),

      ),
      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.menu), onPressed: null),
          Text("Flutter task 3", style: TextStyle(fontSize: 20, color: Color(0xff555555))),
        ],
      ),
    );
  }
}
