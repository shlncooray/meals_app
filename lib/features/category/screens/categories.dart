import 'package:flutter/material.dart';
import 'package:meals_app/features/category/widgets/category_item.dart';
import 'package:meals_app/models/category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late List<Category> foodCategories;

  @override
  void initState() {
    super.initState();
    foodCategories = fetchCategories();
    // #TODO - Fetch via HTTP Rest API
  }

  void _selectCategory(BuildContext context, Category category) {
    // #TODO - Implement Navigation to Selected Food Category Meal Screen
  }
  @override
  Widget build(BuildContext context) {
    // #TODO - Add FutureBuilder<List<Category>> return as body

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
    ));

    // #TODO - Change ListView to GridView
  }
}
