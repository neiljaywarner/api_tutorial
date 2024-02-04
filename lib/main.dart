import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'activity.dart';

final activityProvider = FutureProvider.autoDispose((ref) async {
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
});

void main() => runApp(const ProviderScope(child: MyApp2()));

class MyApp2 extends ConsumerWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(
        appBar: AppBar(title: const Text('Fetch Data Example')),
        body: Center(
            child: ref.watch(activityProvider).when(
                data: (activity) => Text(activity.activity),
                error: (error, __) => Text(error.toString()),
                loading: () => const CircularProgressIndicator())),
      ),
    );
  }
}
