// To parse this JSON data, do
//
//     final userPostModel = userPostModelFromJson(jsonString);

import 'dart:convert';

UserPostModel userPostModelFromJson(String str) => UserPostModel.fromJson(json.decode(str));

String userPostModelToJson(UserPostModel data) => json.encode(data.toJson());

class UserPostModel {
    UserPostModel({
        this.title,
        this.body,
        this.userId,
        this.id,
    });

    String? title;
    String? body;
    int? userId;
    int? id;

    factory UserPostModel.fromJson(Map<String, dynamic> json) => UserPostModel(
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "userId": userId,
        "id": id,
    };
}
