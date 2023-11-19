import 'package:flutter/material.dart';
import 'package:flutter_basic/materi/local%20storage%20&%20consume%20api/utils/shared_preferences.dart';
import '../entities/user_entitiy.dart';
import '../widget/github_user_card.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark Users'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<UserEntity>>(
              future: SharedPreferencesUtils.getBookmark(),
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
