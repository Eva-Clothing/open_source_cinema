import "package:flutter/material.dart";
import "./repo.dart";
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User with ChangeNotifier {
  final String userId;
  final String name;
  final String email;

  User({
    @required this.userId,
    @required this.name,
    @required this.email,
  });

  Future<String> addUsers(String token) async {
    final url =
        'https://open-source-cinema-default-rtdb.firebaseio.com/users.json/?auth=$token'; //$userId.json
    print("success");
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'name': name,
          'email': email,
          'userid': userId,
        }),
      );
      print(response.body);
      final responseData2 = json.decode(response.body);
      String _authUserId;
      _authUserId = responseData2['name'];
      return _authUserId;
    } catch (e) {
      print(e.toString());
    }
  }
}

// class Users with ChangeNotifier {
//   Future<String> addProduct(User user) async {
//     final url =
//         'https://open-source-cinema-default-rtdb.firebaseio.com/users.json/?auth=$_token'; //$userId.json
//     print("success");
//     try {
//       final response = await http.post(
//         url,
//         body: json.encode({
//           'name': user.name,
//           'email': user.email,
//           'userid': user.userId,
//         }),
//       );
//       print(response.body);
//       final responseData2 = json.decode(response.body);
//       String _authUserId;
//       _authUserId = responseData2['name'];
//       return _authUserId;
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
