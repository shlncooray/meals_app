import 'package:flutter/material.dart';
import 'package:meals_app/features/category/screens/categories.dart';
import 'package:meals_app/features/filters/screens/filters.dart';
import 'package:meals_app/features/meal/screens/meals.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/app_drawer.dart';

class AppTabsScreen extends StatefulWidget {
  const AppTabsScreen({super.key});

  @override
  State<AppTabsScreen> createState() {
    return _AppTabsScreenState();
  }
}

class _AppTabsScreenState extends State<AppTabsScreen> {
  int _currentIndex = 0;
  final List<Meal> _favouriteMeals = [];

  @override
  void initState() {
    super.initState();
  }

  void _selectNavigationIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _showSnackBar(String message, Color bgColor) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: bgColor,
    ));
  }

  void _onFavouriteToogle(Meal meal) {
    bool isFavourite = _favouriteMeals.contains(meal);

    if (isFavourite) {
      setState(() {
        _favouriteMeals.remove(meal);
      });
      _showSnackBar('${meal.title} is no longer a favourite meal',
          Theme.of(context).colorScheme.error);
    } else {
      setState(() {
        _favouriteMeals.add(meal);
      });
      _showSnackBar('${meal.title} is added as a favourite meal',
          Theme.of(context).colorScheme.primary);
    }
  }

  void _onSelectScreen(String indentifier) {
    Navigator.of(context).pop();
    if (indentifier == 'filters') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onFavouriteToogle: _onFavouriteToogle,
    );
    String activePageTitle = 'Food Categories';

    if (_currentIndex == 1) {
      activePage = MealsScreen(
        meals: _favouriteMeals,
        onFavouriteToogle: _onFavouriteToogle,
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
