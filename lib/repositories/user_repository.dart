import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/add_user_response.dart';

class UserRepository {
  final String userUrl = 'https://reqres.in/api/users?page=1';
  final String addUrl = 'https://reqres.in/api/users';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(userUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> usersJson = data['data'];
      return usersJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<AddUserResponse> addUser(String name, String job) async {
    final response = await http.post(
      Uri.parse(addUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'name': name, 'job': job}),
    );

    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      return AddUserResponse.fromJson(data);
    } else {
      throw Exception('Failed to add user');
    }
  }
}
