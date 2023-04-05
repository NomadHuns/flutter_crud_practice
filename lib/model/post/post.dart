import 'dart:convert';

import 'package:http_riverpod_app/model/post/user.dart';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
    this.user,
  });

  int? userId;
  int? id;
  String? title;
  String? body;
  User? user;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
    "user": user?.toJson(),
  };
}
