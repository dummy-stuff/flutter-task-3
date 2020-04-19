import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:users_fetch/utils/unique_color_generator.dart';

class User {
  int id;
  String name;
  String email;
  String username;
  String phone;
  Color color;

  User({this.id, this.name, this.email, this.username, this.phone, this.color});
}

Future<List<User>> fetchUsers() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/users');

  if (response.statusCode == 200) {
    final parsedJson = json.decode(response.body);
    return getUsers(parsedJson);
  } else {
    throw Exception('Failed to load Users');
  }
}

List<User> getUsers(parsedJson) {
  List<User> users = [];
  parsedJson.forEach((i) {
    final id = i['id'];
    final name = i['name'];
    final email = i['email'];
    final username = i['username'];
    final phone = i['phone'];
    final color = uniqueColorGenerator();
    users.add(User(id:id, name:name, email:email, username:username, phone:phone, color: color));
  });
  return users;
}
