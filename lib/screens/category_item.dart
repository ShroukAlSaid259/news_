import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;

  CategoryItem(this.category, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: category.colorBG,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
          bottomLeft:
              index % 2 == 0 ? Radius.circular(12) : Radius.circular(0.0),
          bottomRight:
              index % 2 == 0 ? Radius.circular(0) : Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            category.image,
            height: 140,
          ),
          Expanded(
              child: Text(
            category.title,
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );
  }
}
