import 'dart:convert';

import 'package:meals_app/models/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'category_provider.g.dart';

@riverpod
Future<List<Category>> category(CategoryRef ref) async {
  var url = 'meals-app-9a2f5-default-rtdb.asia-southeast1.firebasedatabase.app';

  final response = await http.get(Uri.https(url, 'categories.json'));
  final categoryJsonList = json.decode(response.body) as List<dynamic>;
  return categoryJsonList.map((cj) => Category.fromJson(cj)).toList();
}
