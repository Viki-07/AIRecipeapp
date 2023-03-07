import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // appBar: AppBar(title: Text('Meal App'),),
      body: GridView(
        padding: const EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 30,
              crossAxisSpacing: 20),
          children: 
            DUMMY_CATEGORIES
                .map((catData) =>
                    CategoryItem(title: catData.title, color: catData.color,id: catData.id,url:catData.url),)
                .toList()),
    );
  }
}
