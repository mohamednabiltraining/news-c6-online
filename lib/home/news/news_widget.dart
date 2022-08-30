import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_c6_online/api/model/news_response.dart';
import 'package:news_c6_online/my_date_utils.dart';

class NewsWidget extends StatelessWidget {

  News news;
  NewsWidget(this.news);
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18.0),
            child: CachedNetworkImage(
              height: 230,width: double.infinity,
              fit: BoxFit.cover,
              imageUrl: news.urlToImage??"",
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(news.author??"",
          style: TextStyle(
            color: Color(0xFF79828B),
            fontSize: 12,
          ),),
          Text(news.title??"",
              style: TextStyle(
                color: Color(0xFF42505C),
                fontSize: 18,
                fontWeight: FontWeight.w500
              )),
          Text(MyDateUtils.formatNewsDate(news.publishedAt??""),
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Color(0xFF79828B),
                fontSize: 12,
              )),
        ],
      ),
    );
  }
}
