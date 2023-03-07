import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/category_screen.dart';
import 'package:mealapp/favourites_screen.dart';
import 'package:mealapp/main_drawer.dart';
import 'package:mealapp/models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;
  const TabsScreen({super.key, required this.favoriteMeal});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  
 late List<Map<String, dynamic>> pages;
  int selectedindex = 0;
  void selectPage(int index) {
    setState(() {
      selectedindex = index;
    });
  }
  @override
  void initState() {
  pages = [
    {'page': CategoryScreen(), 'title': 'Categories'},
    {'page': FavouriteScreen(favMeal: widget.favoriteMeal), 'title': 'Favorites'},
  ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(pages[selectedindex]['title']),
      ),
      drawer: MainDrawer(),
      body: pages[selectedindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        enableFeedback: true,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        currentIndex: selectedindex,
        type: BottomNavigationBarType.shifting,
        onTap: selectPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Favorites')
        ],
      ),
    );
  }
}
