import 'package:flutter/material.dart';
import '../../../data/model/sources_response/source.dart';

class SourcesTabsItem extends StatelessWidget {
  SourcesTabsItem({required this.source, required this.isSelected, super.key});

  Source source;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
          color: isSelected ? Theme.of(context).primaryColor : Colors.white),
      child: Text(
        source.name ?? "",
        style: TextStyle(
          color: isSelected ? Colors.white : Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
