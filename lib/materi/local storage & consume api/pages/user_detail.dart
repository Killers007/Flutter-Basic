import 'package:flutter/material.dart';
import 'package:flutter_basic/materi/local%20storage%20&%20consume%20api/entities/github_user_entity.dart';
import 'package:flutter_basic/materi/local%20storage%20&%20consume%20api/entities/user_entitiy.dart';
import 'package:flutter_basic/materi/local%20storage%20&%20consume%20api/utils/format_number.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../repository/github_api.dart';
import '../widget/github_user_card.dart';
import 'component/image_preview.dart';

class UserDetail extends StatefulWidget {
  final String userId;
  const UserDetail({required this.userId, super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userId = widget.userId;

    return Scaffold(
      appBar: AppBar(
        title: Text(userId),
      ),
      body: Column(
        children: [
          // User details
          FutureBuilder<GitHubUserEntity>(
            future: GithubApi().fetchUserDetail(userId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(
                  height: 140,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final user = snapshot.data;
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyImagePreview(
                                        imageUrl: user.avatarUrl),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: user!.avatarUrl,
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(user.avatarUrl),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Flexible(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.name ?? '-',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(user.email ?? '-'),
                                GestureDetector(
                                  onTap: () {
                                    launchUrlString(user.htmlUrl);
                                  },
                                  child: Text(
                                    user.htmlUrl,
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Flex(
                                  clipBehavior: Clip.antiAlias,
                                  direction: Axis.horizontal,
                                  children: [
                                    badgeUser(Icons.supervised_user_circle,
                                        user.followers),
                                    const SizedBox(width: 10),
                                    badgeUser(
                                        Icons.supervised_user_circle_outlined,
                                        user.following),
                                    const SizedBox(width: 10),
                                    badgeUser(Icons.balance_outlined,
                                        user.publicRepos),
                                    const SizedBox(width: 10),
                                    badgeUser(Icons.workspaces_sharp,
                                        user.publicGists),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        user.bio ?? '-',
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                );
              }
            },
          ),

          TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.supervised_user_circle),
                    SizedBox(width: 10),
                    Text('Followers'),
                  ],
                ),
              ),
              Tab(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.supervised_user_circle_outlined),
                    SizedBox(width: 10),
                    Text('Following'),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                getTab(builder: GithubApi().fetchFollowers(userId)),
                getTab(builder: GithubApi().fetchFollowing(userId)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget badgeUser(IconData icon, int numbers) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 5),
        Text(
          formatNumber(numbers),
          style: const TextStyle(color: Colors.grey),
          overflow: TextOverflow.clip,
        ),
      ],
    );
  }

  Widget getTab({Future<List<UserEntity>>? builder}) {
    return Expanded(
      child: FutureBuilder<List<UserEntity>>(
        future: builder,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final userList = snapshot.data!;

            if (userList.isEmpty) {
              return const Center(
                child: Text('Not data showed'),
              );
            }
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
    );
  }
}
