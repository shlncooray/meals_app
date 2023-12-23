import 'package:flutter/material.dart';
import 'package:meals_app/features/category/widgets/category_item.dart';
import 'package:meals_app/models/category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late Future<List<Category>> foodCategories;

  @override
  void initState() {
    super.initState();
    foodCategories = fetchCategoriesFutue();
    // #TODO - Fetch via HTTP Rest API
  }

  void _selectCategory(BuildContext context, Category category) {
    // #TODO - Implement Navigation to Selected Food Category Meal Screen
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
