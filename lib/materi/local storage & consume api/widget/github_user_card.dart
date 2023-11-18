import 'package:flutter/material.dart';
import '../entities/user_entitiy.dart';

class GithubUserCard extends StatelessWidget {
  final UserEntity user;
  const GithubUserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.grey.shade200, // Border color
          width: 1.5, // Border width
        ),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: CircleAvatar(
              radius: 80, // Adjust the size as needed
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                user.avatarUrl,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.login,
                        style: const TextStyle(fontSize: 18),
                        overflow: TextOverflow.clip,
                      ),
                      Text(
                        user.url,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
