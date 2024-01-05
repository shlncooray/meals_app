import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meals_app/models/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_provider.g.dart';

@riverpod
Future<List<Category>> category(CategoryRef ref) async {
  var url = 'meals-app-prep-default-rtdb.asia-southeast1.firebasedatabase.app';
  final response = await http.get(Uri.https(url, 'categories.json'));
  final jsonList = json.decode(response.body) as List<dynamic>;
  return jsonList.map((j) => Category.fromJson(j)).toList();
}
