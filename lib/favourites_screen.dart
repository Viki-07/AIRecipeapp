import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';

import 'meal_item.dart';

class FavouriteScreen extends StatefulWidget {

  final List<Meal> favMeal;
  const FavouriteScreen({super.key, required this.favMeal});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text(title!)),
        body: !widget.favMeal.isEmpty
            ? SafeArea(
                minimum: EdgeInsets.all(10),
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return MealItem(
                        id: widget.favMeal[index].id,
                        title: widget.favMeal[index].title,
                        imageUrl: widget.favMeal[index].imageUrl,
                        duration: widget.favMeal[index].duration,
                        complexity: widget.favMeal[index].complexity,
                        affordability: widget.favMeal[index].affordability);
                  },
                  itemCount: widget.favMeal.length,
                ),
              )
            : Center(
                child: Text('Sorry No Meals in Favorites...')));
  }
}