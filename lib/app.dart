import 'package:flutter/material.dart';
import 'package:meals_app/features/category/screens/categories.dart';
import 'package:meals_app/features/meal/screens/meals.dart';
import 'package:meals_app/screens/app_tabs.dart';
import 'package:meals_app/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: kLightTheme, darkTheme: kDarkTheme, home: CategoriesScreen());
  }
}
