import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meals_app/data/categories_mock.dart';
import 'package:meals_app/util.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  final String id;
  final String title;
  final Color color;
}

List<Category> fetchCategories() {
  return foodCategories;
}

Future<List<Category>> fetchCategoriesFutue() async {
  var url =
      'https://my-json-server.typicode.com/shlncooray/meals_app/categories';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);

    List<Category> categories = data.map((cat) {
      return Category(
          id: cat['id'],
          title: cat['title'],
          color: getColorFromString(cat['color']));
    }).toList();
    return categories;
  } else {
    throw Exception('Failed to get categories');
  }
}
