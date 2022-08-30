import 'package:flutter/material.dart';

class HomeSideMenu extends StatelessWidget {
  static const int Settings = 10;
  static const int Categories = 20;
  Function onItemClickCallBack;
  HomeSideMenu(this.onItemClickCallBack);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 64),
          color: Theme.of(context).primaryColor,
          child: Text('News App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24
          ),),
        ),
        InkWell(
          onTap: (){
            onItemClickCallBack(Categories);
          },
          child: Row(children: [
            ImageIcon(
                AssetImage('assets/images/ic_categories.png',),
              size: 48,
            ),
            Text('Categories',style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF303030)

            ),)
          ],),
        ),
        InkWell(
          onTap: (){
            onItemClickCallBack(Settings);
          },
          child: Row(children: [
            ImageIcon(
              AssetImage('assets/images/ic_settings.png',),
              size: 48,
            ),
            Text('Settings',style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF303030)

            ),)
          ],),
        )
      ],

    );
  }
}
