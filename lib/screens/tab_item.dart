import 'package:flutter/material.dart';
import 'package:news_1/models/sources.dart';

class TabItemScreen extends StatelessWidget {
  Sources sources;
  bool isSelected;

  TabItemScreen(this.sources, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(25),
          color: isSelected ? Colors.green : Colors.transparent),
      child: Text(
        sources.name ?? "",
        style: TextStyle(
            color: isSelected ? Colors.white : Colors.green, fontSize: 15),
      ),
    );
  }
}
