import 'package:flutter/material.dart';
import 'package:news_app/model/source.dart';
import 'package:news_app/ui/home/category_details/sources_tabs_widget.dart';

import '../../../model/category.dart';

class CategoryDetails extends StatelessWidget {
  Category category;
  CategoryDetails(this.category, {super.key});
  List<Source> sourcesList = [
    Source('ABC', 'ABC'),
    Source('Al Jazeera', 'Al Jazeera'),
    Source('Ary', 'Ary'),
    Source('Axios', 'Axios'),
    Source('BBC', 'BBC'),
    Source('ABC', 'ABC'),
    Source('Al Jazeera', 'Al Jazeera'),
    Source('Ary', 'Ary'),
    Source('Axios', 'Axios'),
    Source('BBC', 'BBC'),
  ];

  @override
  Widget build(BuildContext context) {
    return SourcesTabsWidget(sourcesList);
  }
}
