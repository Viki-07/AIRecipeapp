import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: ()=>Navigator.pushReplacementNamed(context, "/"),
            leading: Icon(Icons.restaurant, size: 30, color: Colors.black),
            title: Text(
              'Meals',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            onTap: ()=>Navigator.pushReplacementNamed(context, "/filter-screen"),
            leading:
                Icon(Icons.filter_list_outlined, size: 30, color: Colors.black),
            title: Text(
              'Filter',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
