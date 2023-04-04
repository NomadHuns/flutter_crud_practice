import 'dart:convert';

class HomaPagePostDto {
  int? id;
  String? title;

  HomaPagePostDto({this.id, this.title});

  factory HomaPagePostDto.fromJson(Map<String, dynamic> json) => HomaPagePostDto(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}