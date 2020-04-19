import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final String name;
  final String email;
  final String username;
  final String phone;
  final String initials;
  final Color color;

  // @MyNavigation
  UserPage(
      {this.name,
      this.email,
      this.username,
      this.phone,
      this.color,
      this.initials});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          name,
          style: TextStyle(color: Color(0xff333333)),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Color(0xff333333),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color(0xffffffff),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              child: Text(
                initials,
                style: TextStyle(fontSize: 30),
              ),
              foregroundColor: Color(0xffffffff),
              backgroundColor: color,
              radius: 40,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(name),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text(email),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(username),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(phone),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
