import 'package:flutter/material.dart';
import '../../../data/model/category.dart';
import 'category_item.dart';

typedef OnCategoryClick = void Function(Category category);

class CategoriesFragment extends StatelessWidget {
  OnCategoryClick onCategoryClick;

  CategoriesFragment({required this.onCategoryClick, super.key});

  List<Category> categories = Category.getAllCategoryItems();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pick you category \n of interest',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 22,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategoryClick(categories[index]);
                  },
                  child:
                      CategoryItem(category: categories[index], index: index),
                );
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
