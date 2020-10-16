import 'dart:convert';

import 'package:flutter_ex/models/user.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  String _url = 'http://jsonplaceholder.typicode.com/users';

  Future<List<User>> getUser() async {
    final response = await http.get(_url);
    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}
