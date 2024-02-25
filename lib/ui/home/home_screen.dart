import 'package:flutter/material.dart';
import 'package:news_app/ui/home/home_drawer.dart';
import 'package:news_app/ui/home/settings/settings_fragment.dart';

import '../../model/category.dart';
import 'categories/categories_fragment.dart';
import 'category_details/category_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = 'HomeSc';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    selectedWidget = CategoriesFragment(onCategoryClick: onCategoryClick);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News'),
        ),
        drawer: HomeDrawer(onOptionClick),
        body: selectedWidget,
      ),
    );
  }

  late Widget selectedWidget;

  void onOptionClick(ItemList item) {
    Navigator.pop(context);
    switch (item) {
      case ItemList.categories:
        {
          selectedWidget = CategoriesFragment(onCategoryClick: onCategoryClick);
        }
      case ItemList.settings:
        {
          selectedWidget = const SettingsFragment();
        }
    }
    setState(() {});
  }

  void onCategoryClick(Category category) {
    selectedWidget = CategoryDetails(category);
    setState(() {});
  }
}
