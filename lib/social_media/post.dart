import 'package:flutter/material.dart';

class Comment {
  final String username;
  final String text;

  Comment({required this.username, required this.text});
}

class Post {
  final String username;
  final String content;
  int likes;
  bool liked;
  final List<Comment> comments;

  Post({
    required this.username,
    required this.content,
    this.likes = 0,
    this.liked = false,
    List<Comment>? comments,
  }) : comments = comments ?? [];

  IconData get likeIcon => liked ? Icons.favorite : Icons.favorite_border;
}