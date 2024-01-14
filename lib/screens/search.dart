import 'package:flutter/material.dart';

import '../models/news.dart';
import '../shared/network/local/remote/api_manger.dart';
import 'news_item.dart';

class NewsSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(onPressed: (){
        showResults(context);

      }, icon: Icon(Icons.search,color: Colors.black,size: 25,))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
   return IconButton(onPressed: (){
     Navigator.pop(context);
   }, icon: Icon(Icons.close,color: Colors.black,size: 25,));
  }

  @override
  Widget buildResults(BuildContext context) {
   return  FutureBuilder<NewsResponse>(
       future: ApiManager.getNews(quary: query),
       builder: (context, snapshot) {
         if (snapshot.connectionState == ConnectionState.waiting) {
           return Center(child: CircularProgressIndicator());
         }
         if (snapshot.hasError) {
           return Center(
             child: Column(
               children: [
                 Text("Something want Wrong"),
                 TextButton(onPressed: () {}, child: Text("Try Again"))
               ],
             ),
           );
         }
         if (snapshot.data!.status != "ok") {
           return Center(
             child: Column(
               children: [
                 Text(snapshot.data!.message ?? ""),
                 TextButton(onPressed: () {}, child: Text("Try Again"))
               ],
             ),
           );
         }
         var newsData = snapshot.data?.articles ?? [];
         return ListView.builder(

             itemCount: newsData.length,
             itemBuilder: (context, index) {
               return NewsItem(newsData[index]);
             });
       });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   return Text("show Suggestions");
  }
  
}