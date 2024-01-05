import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meals_app/models/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_provider.g.dart';

@riverpod
Future<List<Category>> category(CategoryRef ref) async {
  var url =
      'https://my-json-server.typicode.com/shlncooray/meals_app/categories';
  final response = await http.get(Uri.parse(url));
  final jsonList = json.decode(response.body) as List<dynamic>;
  return jsonList.map((j) => Category.fromJson(j)).toList();
}
