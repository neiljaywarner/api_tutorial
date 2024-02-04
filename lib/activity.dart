class Activity {
  final String activity, type;

  Activity({required this.activity, required this.type});

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        activity: json['activity'] as String,
        type: json['type'] as String,
      );

  @override
  String toString() => "Activity(activity: $activity,type: $type)";
}

// from https://dartj.web.app/ from below
/*
{
    "activity": "Bake something you've never tried before",
    "type": "cooking",
}
 */
