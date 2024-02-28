import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({required this.category, required this.index, super.key});
  Category category;
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomRight: Radius.circular(index.isEven ? 0 : 18),
            bottomLeft: Radius.circular(index.isEven ? 18 : 0),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/${category.imageName}',
            height: 115,
          ),
          Text(category.title,
              style: const TextStyle(
                fontSize: 22,
              ))
        ],
      ),
    );
  }
}
