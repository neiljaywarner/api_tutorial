class Activity {
  String? activity;
  String? type;
  int? participants;
  double? price;
  String? link;
  String? key;
  double? accessibility;

  Activity({
    this.activity,
    this.type,
    this.participants,
    this.price,
    this.link,
    this.key,
    this.accessibility,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activity: json['activity'] as String?,
      type: json['type'] as String?,
      participants: json['participants'] as int?,
      price: json['price'] as double?,
      link: json['link'] as String?,
      key: json['key'] as String?,
      accessibility: json['accessibility'] as double?,
    );
  }

  @override
  String toString() =>
      "Activity(activity: $activity,type: $type,participants: $participants,price: $price,link: $link,key: $key,accessibility: $accessibility)";

  @override
  int get hashCode => Object.hash(activity, type, participants, price, link, key, accessibility);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Activity &&
          runtimeType == other.runtimeType &&
          activity == other.activity &&
          type == other.type &&
          participants == other.participants &&
          price == other.price &&
          link == other.link &&
          key == other.key &&
          accessibility == other.accessibility;
}

// from https://dartj.web.app/ from below with "declare a variable as nullable"
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
