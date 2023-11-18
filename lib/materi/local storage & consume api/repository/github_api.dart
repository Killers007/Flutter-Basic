import 'dart:convert';

import '../entities/user_entitiy.dart';
import 'package:http/http.dart' as http;

class GithubApi {
  static Future<List<UserEntity>> fetchUsers({user = 'hanzo'}) async {
    final response = await http
        .get(Uri.parse('https://api.github.com/search/users?q=$user'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['items'];
      return data.map((user) => UserEntity.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  static Future<List<Map<String, dynamic>>> fetchUserDetail(
      String username) async {
    final response =
        await http.get(Uri.parse('https://api.github.com/users/$username'));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load user repositories');
    }
  }

  static Future<List<Map<String, dynamic>>> fetchFollowers(
      String username) async {
    final response = await http
        .get(Uri.parse('https://api.github.com/users/$username/followers'));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load user repositories');
    }
  }

  static Future<List<Map<String, dynamic>>> fetchFollowing(
      String username) async {
    final response = await http
        .get(Uri.parse('https://api.github.com/users/$username/following'));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load user repositories');
    }
  }
}
