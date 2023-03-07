import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';

import 'package:mealapp/models/meal.dart';

class MealDetailItem extends StatelessWidget {
  static const routeName = '/meal-detail';
  bool Function(String id) isFavorite;
  void Function(String id) toggleFav;
  MealDetailItem(
      {super.key, required this.isFavorite, required this.toggleFav});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    ;
    final selectdeMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    Affordability aff = selectdeMeal.affordability;
    String Afford;
    String Diff;
    switch (selectdeMeal.complexity) {
      case Complexity.Simple:
        Diff = "Simple";
        break;
      case Complexity.Challenging:
        Diff = "Challenging";
        break;
      case Complexity.Hard:
        Diff = "Hard";
        break;
    }
    if (aff == Affordability.Luxurious)
      Afford = "Luxurious";
    else if (aff == Affordability.Pricey)
      Afford = "Pricey";
    else
      Afford = "Affordable";

    return Scaffold(
        appBar: AppBar(title: Text(selectdeMeal.title), actions: [
          IconButton(
              onPressed: (() => toggleFav(mealId)),
              icon: isFavorite(mealId)
                  ? Icon(Icons.star)
                  : Icon(Icons.star_border))
        ]),
        body: Column(
          children: [
            Stack(children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                height: 300,
                width: 400,
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  color: Colors.black38,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Image.network(
                    selectdeMeal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 200,
                left: 30,
                right: 30,
                bottom: 30,
                child: Container(
                    child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Card(
                    // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(1)),
                    color: Colors.white60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.schedule),
                            SizedBox(
                              width: 6,
                            ),
                            Text('${selectdeMeal.duration.toString()} min'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.work),
                            SizedBox(
                              width: 6,
                            ),
                            Text(Diff),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.attach_money),
                            SizedBox(
                              width: 6,
                            ),
                            Text(Afford),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
              ),

            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Divider(
                thickness: 2,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(2.0),
              color: Colors.white12,
              width: double.infinity,
              height: 420,
              child: ContainedTabBarView(
                tabs: [
                  Text(
                    'Ingredients',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text('Steps',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ],
                views: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      height: 250,
                      width: 450,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemBuilder: ((context, index) => Card(
                            elevation: 3,
                            child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Row(children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.blue[100],
                                    child: Text((index + 1).toString()),
                                  ),
                                  Container(
                                    width: 260,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      selectdeMeal.ingredients[index],
                                      style: TextStyle(
                                          overflow: TextOverflow.clip),
                                    ),
                                  )
                                ])))),
                        itemCount: selectdeMeal.ingredients.length,
                      )),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      height: 250,
                      width: 450,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemBuilder: ((context, index) => Card(
                            elevation: 3,
                            child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Row(children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.blue[100],
                                    child: Text((index + 1).toString()),
                                  ),
                                  Container(
                                      width: 260,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        selectdeMeal.steps[index],
                                        style: TextStyle(
                                            overflow: TextOverflow.clip),
                                      ))
                                ])))),
                        itemCount: selectdeMeal.steps.length,
                      )),
                ],
                onChange: (index) => print(index),
              ),
            )
          ],
        ));
  }
}
