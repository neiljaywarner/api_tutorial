import 'dart:convert';

String activityToJson(Activity data) => json.encode(data.toJson());

class Activity {
  String activity;
  String type;
  int participants;
  double price;
  String link;
  String key;
  double accessibility;

  Activity({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        activity: json["activity"],
        type: json["type"],
        participants: json["participants"],
        price: json["price"]?.toDouble(),
        link: json["link"],
        key: json["key"],
        accessibility: json["accessibility"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "activity": activity,
        "type": type,
        "participants": participants,
        "price": price,
        "link": link,
        "key": key,
        "accessibility": accessibility,
      };
}

// from quicktype.io from
/*
{
  "activity": "Bake something you've never tried before",
  "type": "cooking",
  "participants": 1,
  "price": 0.4,
  "link": "",
  "key": "5665663",
  "accessibility": 0.3
}
 */
