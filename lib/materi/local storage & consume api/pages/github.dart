import 'package:flutter/material.dart';
import 'package:flutter_basic/materi/local%20storage%20&%20consume%20api/pages/bookmark.dart';
import 'package:flutter_basic/materi/local%20storage%20&%20consume%20api/utils/shared_preferences.dart';
import '../entities/user_entitiy.dart';
import '../pages/auth.dart';
import '../repository/github_api.dart';
import '../widget/github_user_card.dart';

class Github extends StatefulWidget {
  const Github({super.key});

  @override
  State<Github> createState() => _GithubState();
}

class _GithubState extends State<Github> {
  late List<UserEntity> userList;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Users'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Bookmark()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.bookmark),
            ),
          ),
          GestureDetector(
            onTap: () {
              SharedPreferencesUtils.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Auth()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  color: Colors.grey,
                  onPressed: () {
                    final query = _searchController.text;
                    if (query.isNotEmpty) {
                      setState(() {});
                    }
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: FutureBuilder<List<UserEntity>>(
              future: GithubApi().fetchUsers(
                  user: _searchController.text.isEmpty
                      ? 'Hanzo'
                      : _searchController.text),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final userList = snapshot.data!;
                  return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      final user = userList[index];
                      return GithubUserCard(
                        user: user,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
