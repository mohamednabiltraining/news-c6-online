import 'package:flutter/material.dart';
import 'package:news_c6_online/api/model/sources_response.dart';
import 'package:news_c6_online/home/news/news_list.dart';
import 'package:news_c6_online/home/news/source_tab.dart';

class SourcesTabs extends StatefulWidget {
  List<Source> sources;
  SourcesTabs(this.sources);

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index){
                selectedTab = index;
                setState(() {

                });
              },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: widget.sources.map((source){
                  var isSelected = widget.sources.indexOf(source) == selectedTab;
              return SourceTab(source,isSelected);
            }).toList() ),
            NewsList(widget.sources[selectedTab])
          ],
        ),
      ),
    );
  }
}
