import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/filter_screen.dart';
import 'package:mealapp/meal_detail.dart';
import 'package:mealapp/selected_category.dart';
import 'package:mealapp/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availMeal = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];
  void toggleFavorite(String id) {
    final existingIndex =
        favoriteMeals.indexWhere((element) => element.id == id);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else
      setState(() {
        favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      });
  }

  bool isMealFavorite(String id) {
    return favoriteMeals.any((element) => element.id == id);
  }

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availMeal = DUMMY_MEALS.where((element) {
        if (filters['gluten']! && !element.isGlutenFree) {
          return false;
        }
        if (filters['lactose']! && !element.isLactoseFree) {
          return false;
        }
        if (filters['vegan']! && !element.isVegan) {
          return false;
        }
        if (filters['vegetarian']! && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.brown,
      ),
      themeMode: ThemeMode.light,
      home: TabsScreen(favoriteMeal: favoriteMeals),
      // home:SplashScreen(
      //   seconds: 8,
      //   navigateAfterSeconds:const TabsScreen(),
      //   title: new Text(
      //     'SplashScreen Example',
      //     style: new TextStyle(
      //         fontWeight: FontWeight.bold,
      //         fontSize: 20.0,
      //         color: Colors.white),
      //   ),
      //   backgroundColor: Colors.lightBlue[200],
      // ),
      routes: {
        FilterScreen.nameRoute: (ctx) =>
            FilterScreen(setFilters: setFilters, currentFilter: filters),
        SelectedCategory.nameRoute: (ctx) =>
            SelectedCategory(availMeal: availMeal),
        MealDetailItem.routeName: (ctx) => MealDetailItem(isFavorite:isMealFavorite,toggleFav:toggleFavorite),
      },
    );
  }
}
