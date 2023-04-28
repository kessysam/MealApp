import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(
                Icons.category,
              ),
              text: 'Categories',
            ),
            Tab(
              icon: Icon(
                Icons.start,
              ),
              text: 'Favourites',
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavouritesScreen(),
          ],
        ),
      ),
    );
  }
}
