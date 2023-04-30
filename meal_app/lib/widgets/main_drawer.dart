import 'package:flutter/material.dart';
import 'package:meal_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _buildListTile(String title, IconData icon, Function() tapHanlder) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w700,
        ),
      ),
      onTap: tapHanlder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Cooking up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.pink,
              ),
            ),
            color: Colors.accents.last,
          ),
          const SizedBox(
            height: 30,
          ),
          _buildListTile(
            'Meals',
            Icons.restaurant,
            () => Navigator.of(context).pushNamed('/'),
          ),
          _buildListTile('Filters', Icons.settings,
              () => Navigator.of(context).pushNamed(FilterScreen.routeName)),
        ],
      ),
    );
  }
}
