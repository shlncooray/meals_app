import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meals_app/data/categories_mock.dart';

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

// #TODO implemet fetchCategoriesFuture to fetch data via HTTP Rest API
