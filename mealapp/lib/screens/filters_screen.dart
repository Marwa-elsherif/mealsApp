import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "FiltersScreen";
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.saveFilters, this.currentFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;
  @override
  @override
  void initState() {
    _GlutenFree = widget.currentFilters['gluten'];
    _LactoseFree = widget.currentFilters['lactose'];
    _Vegan = widget.currentFilters['vegan'];
    _Vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String description, bool currentVal, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentVal,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _GlutenFree,
                'lactose': _LactoseFree,
                'vegan': _Vegan,
                'vegetarian': _Vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    'Gluten-Free', 'only include gluten_free', _GlutenFree,
                    (newValue) {
                  setState(() {
                    _GlutenFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Lactose-free', 'only include Lactose-Free', _LactoseFree,
                    (newValue) {
                  setState(() {
                    _LactoseFree = newValue;
                  });
                }),
                buildSwitchListTile('Vegan', 'only include Vegan', _Vegan,
                    (newValue) {
                  setState(() {
                    _Vegan = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Vegetarian', 'only include Vegetarian', _Vegetarian,
                    (newValue) {
                  setState(() {
                    _Vegetarian = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
