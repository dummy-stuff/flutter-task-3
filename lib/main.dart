import 'package:flutter/material.dart';
import 'package:users_fetch/models/users_model.dart';
import 'package:users_fetch/utils/user_page.dart';
import 'package:users_fetch/widgets/custom_appbar.dart';
import 'package:users_fetch/widgets/main_menu_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers();
  }

  final theStyle = TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomAppBar(),
              MainMenuText(),
              Expanded(
                child: Center(
                  child: FutureBuilder<List<User>>(
                    future: futureUsers,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, i) {
                            final nameArr = snapshot.data[i].name.split(' ');

                            String initials;
                            if (nameArr.length > 2) {
                              nameArr.removeAt(0);
                              initials = nameArr.map((e) => e[0]).join();
                            } else {
                              initials = nameArr.map((e) => e[0]).join();
                            }

                            return ListTile(
                              leading: CircleAvatar(
                                child: Text(initials),
                                backgroundColor: snapshot.data[i].color,
                                foregroundColor: Color(0xffffffff),
                              ),
                              title: Text(snapshot.data[i].name),
                              subtitle: Text(snapshot.data[i].email),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UserPage(
                                      name: snapshot.data[i].name,
                                      color: snapshot.data[i].color,
                                      email: snapshot.data[i].email,
                                      phone: snapshot.data[i].phone,
                                      username: snapshot.data[i].username,
                                      initials: initials,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
