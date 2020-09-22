import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> curentFilters;

  FiltersScreen(this.curentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  void initState() {
    super.initState();
    _glutenFree = widget.curentFilters['gluten'];
    _vegetarian = widget.curentFilters['vegetarian'];
    _vegan = widget.curentFilters['vegan'];
    _lactoseFree = widget.curentFilters['lactose'];
  }

  Widget buildSwitchTile(
    String title,
    String description,
    bool currentValue,
    Function updateValues,
  ) {
    return SwitchListTile(
      value: currentValue,
      onChanged: (newValue) {
        setState(() {
          currentValue = newValue;
        });
      },
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters!"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      //drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal Selection',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchTile(
                  'Gluten - Free',
                  'This will only show Gluten Free food items',
                  _glutenFree,
                  (newValue) => setState(
                    () {
                      _glutenFree = newValue;
                    },
                  ),
                ),
                buildSwitchTile(
                    'Veg - Free',
                    'This will only show Veg Free food items',
                    _vegetarian,
                    (newValue) => setState(
                          () {
                            _vegetarian = newValue;
                          },
                        )),
                buildSwitchTile(
                  'Vegan - Free',
                  'This will only show Vegan Free food items',
                  _vegan,
                  (newValue) => setState(
                    () {
                      _vegan = newValue;
                    },
                  ),
                ),
                buildSwitchTile(
                  'Lactose - Free',
                  'This will only show Lactose Free food items',
                  _lactoseFree,
                  (newValue) => setState(
                    () {
                      _lactoseFree = newValue;
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
