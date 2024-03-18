import 'package:flutter/material.dart';
import 'package:mealapp/aiscreen.dart';
import 'dummy_data.dart';
import 'category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Meal App'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AIRecipe(),
                    ));
              },
              child: Card(
                elevation: 10,
                child: Container(
                    alignment: Alignment.center,
                    height: 150,
                    width: 350,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        // shape: BoxShape.rectangle,

                        image: DecorationImage(
                            image: NetworkImage(
                                'https://img.freepik.com/premium-vector/chicken-dish-top-view-with-wooden-pattern-background-chicken-meat-collection-chicken-food-template_761765-41.jpg'),
                            fit: BoxFit.cover),
                        // gradient: LinearGradient(
                        //     colors: [color.withOpacity(0.7), color],
                        //     begin: Alignment.topLeft,
                        //     end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text('AI Recipe Generator',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          shadows: [
                            // Shadow(
                            //   blurRadius: 8.0,
                            //   // color of the shadow
                            //   color: Colors.black,
                            //   offset: Offset(2, 2),
                            // ),
                            // color and font size of the text
                          ],
                        ))),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Container(
              child: Text(
                "Category",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 420,
            child: GridView(
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 20),
                children: DUMMY_CATEGORIES
                    .map(
                      (catData) => CategoryItem(
                          title: catData.title,
                          color: catData.color,
                          id: catData.id,
                          url: catData.url),
                    )
                    .toList()),
          ),
        ],
      ),
    );
  }
}
