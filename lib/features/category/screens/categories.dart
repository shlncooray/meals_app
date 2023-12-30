import 'package:flutter/material.dart';
import 'package:meals_app/features/category/widgets/category_item.dart';
import 'package:meals_app/features/meal/screens/meals.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';

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
    foodCategories = fetchCategoriesFutue();
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
    return Scaffold(
        body: FutureBuilder<List<Category>>(
      future: foodCategories,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.25,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            children: [
              ...snapshot.data!.map((cat) => CategoryItem(
                  category: cat,
                  onSelectCategory: () {
                    _selectCategory(context, cat);
                  }))
            ],
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
