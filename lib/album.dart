// used quicktype
// https://jsonplaceholder.typicode.com/albums/1

// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'dart:convert';

Album albumFromJson(String str) => Album.fromJson(json.decode(str));

class Album {
  final String title;

  Album({required this.title});

  factory Album.fromJson(Map<String, dynamic> json) => Album(title: json["title"]);
}
