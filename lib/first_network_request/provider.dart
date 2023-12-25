//part "provider.g.dart";

import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'models/activity.dart';
import 'package:http/http.dart' as http;
part 'provider.g.dart';

@riverpod
Future<Activity> activity(ActivityRef ref) async {
  final response = await http.get(Uri.https('boredapi.com', '/api/activity'));
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return Activity.fromJson(json);
}