import 'package:flutter/material.dart';
import 'package:news_c6_online/api/api_manager.dart';
import 'package:news_c6_online/api/model/news_response.dart';
import 'package:news_c6_online/api/model/sources_response.dart';
import 'package:news_c6_online/home/news/news_widget.dart';

class NewsList extends StatelessWidget{
  Source source;
  NewsList(this.source);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          FutureBuilder<NewsResponse>(
            future: ApiManager.getNewsBySourceId(source.id ??""),
            builder: (buildContext,snapShot){
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
              return Expanded(
                child: ListView.builder(itemBuilder: (_,index){
                  return NewsWidget((data?.newsList![index])! );
                },itemCount: data?.newsList?.length ?? 0,),
              );
            },
          ),
        ],
      ),
    );
  }
}
