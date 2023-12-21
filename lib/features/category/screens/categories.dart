import 'package:flutter/material.dart';
import 'package:meals_app/data/categories_mock.dart';
import 'package:meals_app/features/category/widgets/category_item.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    // #TODO - Implement Navigation to Selected Food Category Meal Screen
  }

  @override
  Widget build(BuildContext context) {
    // #TODO - Add GridView with a gridDelegator SliverGridDelegateWithFixedCrossAxisCount
    return Scaffold(
      body: ListView.builder(
        itemCount: foodCategories.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryItem(
              category: foodCategories[index],
              onSelectCategory: () {
                _selectCategory(context, foodCategories[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
