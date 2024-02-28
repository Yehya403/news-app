import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager/api_manager.dart';
import 'package:news_app/ui/home/category_details/sources_tabs_widget.dart';

import '../../../model/category.dart';

class CategoryDetails extends StatelessWidget {
  Category category;

  CategoryDetails(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data?.status == 'error') {
          return Center(
            child: Column(
              children: [
                Text(snapshot.data?.message ?? snapshot.error.toString()),
                ElevatedButton(
                    onPressed: () {}, child: const Text('Try again')),
              ],
            ),
          );
        }
        var sourcesList = snapshot.data?.sources;
        return SourcesTabsWidget(sourcesList!);
      },
    );
  }
}
