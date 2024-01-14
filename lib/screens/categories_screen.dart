import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_1/models/category.dart';

import 'package:news_1/screens/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  Function callBack;
  CategoriesScreen(this.callBack);

  @override
  Widget build(BuildContext context) {
    var categories=Category.getCategories();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Pick your category of interest",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Expanded(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
              itemCount: categories.length,
              itemBuilder: (context, index) {
              return InkWell(
                  onTap: (){
                    callBack(categories[index]);
                  },
                  child: CategoryItem(categories[index], index));

              }),
        ),
      ],
    );
  }
}
