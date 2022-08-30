import 'package:flutter/material.dart';
import 'package:news_c6_online/home/categories/categories.dart';
import 'package:news_c6_online/home/home_side_menu.dart';
import 'package:news_c6_online/home/news/news_fragment.dart';
import 'package:news_c6_online/home/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/background.png')
        )
      ),
      child: Scaffold(
        drawer: Drawer(
          child: HomeSideMenu(onSideMenuItemClick),
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Route News App'),
        ),
        body: currentWidget,
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    currentWidget = CategoriesFragment(onCategoryClick);
  }

  late Widget currentWidget ;
  void onCategoryClick(Category category){
    currentWidget = NewsFragment(category);
    setState(() {});
  }
  void onSideMenuItemClick(int type){
    // categories ? settings
    if(type == HomeSideMenu.Categories){
      currentWidget = CategoriesFragment(onCategoryClick);
    }else if(type == HomeSideMenu.Settings){
      currentWidget = SettingsFragment();
    }
    setState(() {});
    Navigator.pop(context);
  }
}
