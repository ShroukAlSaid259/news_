import 'package:flutter/material.dart';
import 'package:news_1/models/news.dart';
import 'package:news_1/screens/news_item.dart';
import 'package:news_1/screens/tab_item.dart';
import 'package:news_1/shared/network/local/remote/api_manger.dart';

import '../models/sources.dart';

class TabsControllerScreen extends StatefulWidget {
  List<Sources> sources;

  TabsControllerScreen(this.sources);

  @override
  State<TabsControllerScreen> createState() => _TabsControllerScreenState();
}

class _TabsControllerScreenState extends State<TabsControllerScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
                indicatorColor: Colors.transparent,
                padding: EdgeInsets.symmetric(vertical: 8),
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                labelColor: Colors.blue,
                tabs: widget.sources
                    .map((source) => TabItemScreen(
                        source,
                        selectedIndex == widget.sources.indexOf(source)
                            ? true
                            : false))
                    .toList()),
            FutureBuilder<NewsResponse>(
                future: ApiManager.getNews(sourceId: widget.sources[selectedIndex].id!),
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
                  return Expanded(
                    child: ListView.builder(
                     
                        itemCount: newsData.length,
                        itemBuilder: (context, index) {
                          return NewsItem(newsData[index]);
                        }),
                  );
                })
          ],
        ));
  }
}
