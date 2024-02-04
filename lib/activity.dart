class Activity {
  String activity;
  String type;
  double price;

  Activity({
    required this.activity,
    required this.type,
    required this.price,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activity: json['activity'] as String,
      type: json['type'] as String,
      price: json['price'] as double,
    );
  }

  @override
  String toString() => "Activity(activity: $activity,type: $type,price: $price)";

  @override
  int get hashCode => Object.hash(activity, type, price);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Activity &&
          runtimeType == other.runtimeType &&
          activity == other.activity &&
          type == other.type &&
          price == other.price;
}

// from https://dartj.web.app/ from below
/*
{
    "activity": "Bake something you've never tried before",
    "type": "cooking",
    "price": 0.4
}
 */
