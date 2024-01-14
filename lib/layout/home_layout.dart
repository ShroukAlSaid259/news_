import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_1/screens/categories_screen.dart';
import 'package:news_1/screens/drawer_widget.dart';
import 'package:news_1/screens/home_screen.dart';
import 'package:news_1/screens/search.dart';
import '../models/category.dart';


class HomeLayout extends StatefulWidget {
  static const String routeName = "Home";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
              bottomLeft:Radius.circular(20) ,
              bottomRight: Radius.circular(20)
            )
          ),
          title: Text(
            "News",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
          actions: [
         SelectedCategoryItem==null?Container():IconButton(onPressed: (){showSearch(context: context, delegate: NewsSearch());}, icon: Icon(Icons.search,color: Colors.white,size: 25,))
          ],
        ),

        drawer: DrawerWidget(whenOpenDrawer),
        body:SelectedCategoryItem==null?CategoriesScreen(SelectedCategoryCallBack):HomeScreen(SelectedCategoryItem!)
    );
  }

  Category? SelectedCategoryItem=null;
void whenOpenDrawer(selectedNumber){
  if(selectedNumber==DrawerWidget.CATEGORIES_NUMBER){
SelectedCategoryItem=null;
  }else if(selectedNumber==DrawerWidget.SETTING_NUMBER){

  }
setState(() {
  Navigator.pop(context);
});
}
  void SelectedCategoryCallBack(Category category){
SelectedCategoryItem=category;
setState(() {

});
  }
}
