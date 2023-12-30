import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/features/category/screens/categories.dart';
import 'package:meals_app/features/filters/screens/filters.dart';
import 'package:meals_app/features/meal/screens/meals.dart';
import 'package:meals_app/providers/favourites_meal_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/app_drawer.dart';

class AppTabsScreen extends ConsumerStatefulWidget {
  const AppTabsScreen({super.key});

  @override
  ConsumerState<AppTabsScreen> createState() {
    return _AppTabsScreenState();
  }
}

class _AppTabsScreenState extends ConsumerState<AppTabsScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _selectNavigationIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onSelectScreen(String indentifier) async {
    Navigator.of(context).pop();
    if (indentifier == 'filters') {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    String activePageTitle = 'Food Categories';

    if (_currentIndex == 1) {
      final favouriteMeals = ref.watch(favouritesMealsProvider);
      activePage = MealsScreen(
        meals: favouriteMeals,
      );
      activePageTitle = 'Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle), // Set Active Page Title
      ),
      drawer: AppDrawer(
        onSelecteScreen: _onSelectScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectNavigationIndex,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Food Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites')
        ],
      ),
    );
  }
}
