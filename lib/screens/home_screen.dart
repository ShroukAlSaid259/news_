

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_1/screens/tabs_controller.dart';

import '../models/category.dart';
import '../models/sources.dart';
import '../shared/network/local/remote/api_manger.dart';

class HomeScreen extends StatelessWidget {
  Category category;
  HomeScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
        future: ApiManager.getSources(category.id),
        builder: (context, Snapshot) {
          if (Snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (Snapshot.hasError) {
            return Center(
              child: Column(children: [
                Text("Something want Wrong"),
                TextButton(onPressed: () {}, child: Text("Try Again"))
              ],),
            );
          }
          if (Snapshot.data!.status != "ok") {
            return Center(
              child: Column(children: [
                Text(Snapshot.data!.message ?? ""),
                TextButton(onPressed: () {}, child: Text("Try Again"))
              ],),
            );
          }
          var sources = Snapshot.data?.sources ?? [];
          return TabsControllerScreen(sources);
        });
  }
}
