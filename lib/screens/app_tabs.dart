import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/features/category/screens/categories.dart';
import 'package:meals_app/features/filters/screens/filters.dart';
import 'package:meals_app/features/meal/screens/meals.dart';
import 'package:meals_app/models/filter.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favourites_meal_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';
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
  Map<Filter, bool> _selectedFilters = kInitialFilter;

  @override
  void initState() {
    super.initState();
  }

  void _selectNavigationIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // # Session8 New Code
  void _onSelectScreen(String indentifier) async {
    Navigator.of(context).pop();
    if (indentifier == 'filters') {
      final results = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            currentFilters: _selectedFilters,
          ),
        ),
      );

      setState(() {
        _selectedFilters = results ?? kInitialFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final availableMeals = meals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactosFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

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
