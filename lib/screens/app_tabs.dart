import 'package:flutter/material.dart';
import 'package:meals_app/widgets/app_drawer.dart';

class AppTabsScreen extends StatefulWidget {
  const AppTabsScreen({super.key});

  @override
  State<AppTabsScreen> createState() {
    return _AppTabsScreenState();
  }
}

class _AppTabsScreenState extends State<AppTabsScreen> {
  @override
  Widget build(BuildContext context) {
    // #TODO - Set Default activePage to set as body and activePageTitle to set AppBar title
    // Default screen -> CategoriesScreen
    // Favourite screen -> MealsScreen with favourite meals

    return Scaffold(
        appBar: AppBar(
          title: const Text('Tabs'), // Set Active Page Title
        ),
        drawer: const AppDrawer(),
        body: const Text('Tabs'));
  }
}
