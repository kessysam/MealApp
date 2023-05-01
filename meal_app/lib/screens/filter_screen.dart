import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _lactoseFree = false;
  var _vegan = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['glutten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;

    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function(bool?) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Filters',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Map<String, bool> _selectedFilters = {
                'glutten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(_selectedFilters);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildSwitchListTile(
                'Glutten-free',
                'Only include gletten-free meals',
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = (newValue != null && newValue) ? true : false;
                  });
                },
              ),
              _buildSwitchListTile(
                'Vegetarian',
                'Only include vegetarian meals',
                _vegetarian,
                (newValue) {
                  setState(() {
                    _vegetarian = (newValue != null && newValue) ? true : false;
                  });
                },
              ),
              _buildSwitchListTile(
                'Lactose-free',
                'Only include lactose-free meals',
                _lactoseFree,
                (newValue) {
                  setState(() {
                    _lactoseFree =
                        (newValue != null && newValue) ? true : false;
                  });
                },
              ),
              _buildSwitchListTile(
                'Vegan',
                'Only include vegan meals',
                _vegan,
                (newValue) {
                  setState(() {
                    _vegan = (newValue != null && newValue) ? true : false;
                  });
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
