import 'package:flutter/material.dart';

import 'create_post_sheet.dart';
import 'post.dart';
import 'post_card.dart';

class SocialMediaPage extends StatefulWidget {
  final String username;

  const SocialMediaPage({super.key, required this.username});

  @override
  State<SocialMediaPage> createState() => _SocialMediaPageState();
}

class _SocialMediaPageState extends State<SocialMediaPage> {
  final List<Post> posts = [
    Post(
      username: 'admin',
      content: 'Welcome to the student social feed!',
      likes: 2,
    ),
    Post(
      username: 'student',
      content: 'Just finished my Flutter lab. 🚀',
      likes: 5,
    ),
  ];

  Future<void> openCreatePost() async {
    final Post? newPost = await showModalBottomSheet<Post>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return CreatePostSheet(username: widget.username);
      },
    );

    if (!mounted || newPost == null) {
      return;
    }

    setState(() {
      posts.insert(0, newPost);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Social')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: openCreatePost,
        icon: const Icon(Icons.add),
        label: const Text('Create Post'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 96, top: 8),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostCard(
            key: ObjectKey(posts[index]),
            post: posts[index],
          );
        },
      ),
    );
  }
}