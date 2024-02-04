import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'activity.dart';

Future<Activity> fetchActivity() async {
  final Dio dio = Dio();
  final response = await dio.get('https://boredapi.com/api/activity');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,then parse the JSON.
    debugPrint(response.toString());

    Activity activity = Activity.fromJson(response.data as Map<String, dynamic>);
    debugPrint(activity.toString());
    return activity;
  } else {
    // If the server did not return a 200 OK response,then throw an exception.
    throw Exception('Failed to load activity.dart');
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Activity> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchActivity();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(
        appBar: AppBar(title: const Text('Fetch Data Example')),
        body: Center(
          child: FutureBuilder<Activity>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.activity);
              } else if (snapshot.hasError) {
                if (kDebugMode) {
                  print(snapshot.error ?? '');
                }
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
