import 'dart:ui';

class Category{
  String id;
  String title;
  String image;
  Color colorBG;
  Category(this.id,this.title,this.image,this.colorBG);
  static List<Category>getCategories(){
    return[
      Category("sports", "Sports", "assets/images/sports.png", Color(0xffC91C22)),
      Category("entertainment", "Entertainment", "assets/images/environment.png", Color(0xff4882CF)),
      Category("technology", "Technology", "assets/images/politics.png", Color(0xffF2D352)),
      Category("business", "Business", "assets/images/bussines.png", Color(0xffCF7E48)),
      Category("general", "General", "assets/images/environment.png", Color(0xff4882CF)),
      Category("health", "Health", "assets/images/health.png", Color(0xffED1E79)),
      Category("science", "Science", "assets/images/science.png", Color(0xffF2D352)),


    ];
  }
}