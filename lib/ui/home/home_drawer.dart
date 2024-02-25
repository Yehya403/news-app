import 'package:flutter/material.dart';

typedef OnOptionClick = void Function(ItemList);

class HomeDrawer extends StatelessWidget {
  HomeDrawer(this.onOptionClick, {super.key});
  OnOptionClick onOptionClick;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 48),
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,
            child: const Text(
              'News App',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onOptionClick(ItemList.categories);
            },
            child: const Row(
              children: [
                Icon(
                  Icons.list,
                  size: 32,
                ),
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              onOptionClick(ItemList.settings);
            },
            child: const Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 32,
                ),
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum ItemList { categories, settings }
