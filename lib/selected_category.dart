import 'package:flutter/material.dart';
import 'package:mealapp/meal_item.dart';
import './dummy_data.dart';
import './models/meal.dart';

class SelectedCategory extends StatelessWidget {
  static const String nameRoute = "/category-meals";
  final List<Meal> availMeal;
  const SelectedCategory({super.key, required this.availMeal});

  // const SelectedCategory({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final mealData = availMeal.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    return Scaffold(
        appBar: AppBar(title: Text(title!)),
        body: !mealData.isEmpty
            ? SafeArea(
                minimum: EdgeInsets.all(10),
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return MealItem(
                        id: mealData[index].id,
                        title: mealData[index].title,
                        imageUrl: mealData[index].imageUrl,
                        duration: mealData[index].duration,
                        complexity: mealData[index].complexity,
                        affordability: mealData[index].affordability);
                  },
                  itemCount: mealData.length,
                ),
              )
            : Center(
                child: Text('Sorry No Meals Available as per your choice...')));
  }
}
