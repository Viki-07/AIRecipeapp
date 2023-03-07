import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String url;
  const CategoryItem(
      {super.key,
      required this.id,
      required this.title,
      required this.color,
      required this.url});
  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed('/category-meals', arguments: {'title': title, 'id': id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectCategory(context),
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              // shape: BoxShape.rectangle,

              image:
                  DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
              // gradient: LinearGradient(
              //     colors: [color.withOpacity(0.7), color],
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(15)),
          child: Text(title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 8.0,
                    // color of the shadow
                    color: Colors.black,
                    offset: Offset(2, 2),
                  ),
                  // color and font size of the text
                ],
              ))),
    );
  }
}
