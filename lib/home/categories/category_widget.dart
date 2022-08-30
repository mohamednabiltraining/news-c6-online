import 'package:flutter/material.dart';
import 'package:news_c6_online/home/categories/categories.dart';

class CategoryWidget extends StatelessWidget {

  Category category;
  int index;
  CategoryWidget(this.category,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topRight:Radius.circular(24) ,
          topLeft: Radius.circular(24),
          bottomLeft: Radius.circular(index%2==0?24:0),
          bottomRight: Radius.circular(index%2==0?0:24)
        )
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/${category.imageName}.png',
          height: 120,fit: BoxFit.fitHeight,),
          Text(category.title,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white
          ),)
        ],
      ),
    );
  }
}
