import 'package:flutter/material.dart';
import 'package:news_c6_online/api/api_manager.dart';
import 'package:news_c6_online/api/model/sources_response.dart';
import 'package:news_c6_online/home/categories/categories.dart';
import 'package:news_c6_online/home/news/sources_tabs.dart';

class NewsFragment extends StatelessWidget {
  Category category;
  NewsFragment(this.category);
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(12),
      child: Column(
          children: [
            FutureBuilder<SourcesResponse>(
                future: ApiManager.getNewsSources(category.id),
                builder: (buildContext, snapShot) {
                  if(snapShot.hasError){
                    return Center(child: Text('${snapShot.error.toString()}'));
                  }else if(snapShot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }
                  var data = snapShot.data;
                  if('error' == data?.status){
                    // we got code and message from server
                    return Center(child: Text('${data?.message}'));
                  }
                  var sources= data?.sources;
                  return SourcesTabs(sources!);
                })
          ],
      ),
    );
  }
}
