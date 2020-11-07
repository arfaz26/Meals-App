import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filtersScreen';
  final Function setfilter;
  final Map<String, bool> filter;
  FiltersScreen(this.filter, this.setfilter);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;
  @override
  initState() {
    _glutenFree = widget.filter['gluten'];
    _vegetarian = widget.filter['vegetarian'];
    _vegan = widget.filter['vegan'];
    _lactoseFree = widget.filter['lactose'];
    super.initState();
  }

  Widget buildSwitchTile(
    String title,
    String subTitle,
    bool forCheck,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: forCheck,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                print('clicked');
                final selectedFilter = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.setfilter(selectedFilter);
              },
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Adjust Meal Selection',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchTile(
                      'Gluten Free',
                      'Only includes gluten-free meals',
                      _glutenFree, (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                  buildSwitchTile(
                      'Vegetarian',
                      'Only includes vegetarian meals',
                      _vegetarian, (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
                  buildSwitchTile('Vegan', 'Only includes vegan meals', _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                  buildSwitchTile(
                      'Lactose Free',
                      'Only includes lactose-free meals',
                      _lactoseFree, (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                ],
              ),
            ),
            // Switch(
            //   value: _switch,
            //   onChanged: (value) {
            //     setState(() {
            //       _switch = value;
            //     });
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
