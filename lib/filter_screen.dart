import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mealapp/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const String nameRoute = "/filter-screen";
  final Function setFilters;
  final Map<String, bool> currentFilter;
  const FilterScreen(
      {super.key, required this.setFilters, required this.currentFilter});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  @override
  void initState() {
    glutenFree = widget.currentFilter['gluten']!;
    lactoseFree = widget.currentFilter['lactose']!;
    vegan = widget.currentFilter['vegan']!;
    vegetarian = widget.currentFilter['vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          title: const Text('Filter'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFiletrs = {
                    'gluten': glutenFree,
                    'lactose': lactoseFree,
                    'vegan': vegan,
                    'vegetarian': vegetarian,
                  };
                  widget.setFilters(selectedFiletrs);
                  Navigator.pushReplacementNamed(context, '/');
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text('Adjust Meals Selection'),
            ),
            Expanded(
                child: ListView(
              children: [
                SwitchListTile(
                    title: const Text('Gluten Free'),
                    value: glutenFree,
                    onChanged: (newvalue) {
                      setState(() {
                        glutenFree = newvalue;
                      });
                    }),
                SwitchListTile(
                    title: const Text('Lactose Free'),
                    value: lactoseFree,
                    onChanged: (newvalue) {
                      setState(() {
                        lactoseFree = newvalue;
                      });
                    }),
                SwitchListTile(
                    title: const Text('Vegan'),
                    value: vegan,
                    onChanged: (newvalue) {
                      setState(() {
                        vegan = newvalue;
                      });
                    }),
                SwitchListTile(
                    title: const Text('Vegetarian'),
                    value: vegetarian,
                    onChanged: (newvalue) {
                      setState(() {
                        vegetarian = newvalue;
                      });
                    })
              ],
            )),
          ],
        ));
  }
}
