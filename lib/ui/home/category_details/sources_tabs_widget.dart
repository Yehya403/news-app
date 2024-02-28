import 'package:flutter/material.dart';
import 'package:news_app/ui/home/news/news_list_widget.dart';
import 'package:news_app/ui/home/category_details/tab_widget.dart';

import '../../../model/sources_response/source.dart';

class SourcesTabsWidget extends StatefulWidget {
  SourcesTabsWidget(this.sources, {super.key});

  List<Source> sources;

  @override
  State<SourcesTabsWidget> createState() => _SourcesTabsWidgetState();
}

class _SourcesTabsWidgetState extends State<SourcesTabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          TabBar(
            indicatorColor: Colors.transparent,
            onTap: (newIndex) {
              setState(() {
                selectedIndex = newIndex;
              });
            },
            isScrollable: true,
            tabs: widget.sources
                .map((source) => TabWidget(
                    source: source,
                    isSelected:
                        widget.sources.indexOf(source) == selectedIndex))
                .toList(),
          ),
          Expanded(
            child: NewsListWidget(
              source: widget.sources[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
