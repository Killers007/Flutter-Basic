import 'dart:convert';

import 'package:flutter_basic/materi/local%20storage%20&%20consume%20api/entities/github_user_entity.dart';

import '../entities/user_entitiy.dart';
import 'package:http/http.dart' as http;

class GithubApi {
  final String endpoint = 'https://api.github.com';

  // 7 Days expired from 2023/11/19 08:30
  // Authenticated requests get a higher rate limit.
  final String myPersonalToken = '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';

  // Add the myPersonalToken to the headers
  late Map<String, String> headers = {
    'Authorization': 'Bearer $myPersonalToken',
    'Content-Type': 'application/json',
  };

  Future<List<UserEntity>> fetchUsers({user = 'hanzo'}) async {
    final response =
        await http.get(Uri.parse('$endpoint/search/users?q=$user'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['items'];
      return data.map((user) => UserEntity.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<GitHubUserEntity> fetchUserDetail(String username) async {
    // throw ArgumentError('LIMIT USER REQUEST');
    final response = await http.get(Uri.parse('$endpoint/users/$username'),
        headers: headers);

    if (response.statusCode == 200) {
      return GitHubUserEntity.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user repositories');
    }
  }

  Future<List<UserEntity>> fetchFollowers(String username) async {
    // throw ArgumentError('LIMIT USER REQUEST');

    final response = await http.get(
        Uri.parse('$endpoint/users/$username/followers'),
        headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((user) => UserEntity.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load user repositories');
    }
  }

  Future<List<UserEntity>> fetchFollowing(String username) async {
    // throw ArgumentError('LIMIT USER REQUEST');

    final response = await http.get(
        Uri.parse('$endpoint/users/$username/following'),
        headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((user) => UserEntity.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load user repositories');
    }
  }
}
