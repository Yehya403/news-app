import 'package:flutter/material.dart';
import 'package:news_app/ui/home/news/news_list.dart';
import 'package:news_app/ui/home/sources/sources_tabs_item.dart';
import '../../../data/model/sources_response/source.dart';

class SourcesTabs extends StatefulWidget {
  const SourcesTabs(this.sources, {super.key});

  final List<Source> sources;

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
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
                .map((source) => SourcesTabsItem(
                    source: source,
                    isSelected:
                        widget.sources.indexOf(source) == selectedIndex))
                .toList(),
          ),
          Expanded(
            child: NewsList(
              source: widget.sources[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
