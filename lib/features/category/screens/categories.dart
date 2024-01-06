import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/features/category/widgets/category_item.dart';
import 'package:meals_app/features/meal/screens/meals.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/category_provider.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late Future<List<Category>> foodCategories;

  @override
  void initState() {
    super.initState();
  }

  void _selectCategory(BuildContext context, Category category) {
    List<Meal> filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(title: category.title, meals: filteredMeals)));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final categories = ref.watch(categoryProvider);
      return Scaffold(
        body: RefreshIndicator(
          onRefresh: () => ref.refresh(categoryProvider.future),
          child: switch (categories) {
            AsyncData(:final value) => GridView(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.25,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                children: [
                  ...value.map((cat) => CategoryItem(
                      category: cat,
                      onSelectCategory: () {
                        _selectCategory(context, cat);
                      }))
                ],
              ),
            AsyncError(:final error) =>
              Text('Oops, something unexpected happened $error'),
            _ => const Center(child: CircularProgressIndicator()),
          },
        ),
      );
    });
  }
}
