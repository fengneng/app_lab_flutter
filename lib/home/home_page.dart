import 'package:flutter/material.dart';
import '../pages/message.dart';
import '../tab_item_model.dart';

import 'activity_page.dart';
import 'hot_page.dart';
import 'rec_page.dart';

class HomePage extends StatelessWidget {
  final List<TabItemModel> _tabs = [
    TabItemModel(
      page: RecPage(),
      title: '首页',
    ),
    TabItemModel(
      page: HotPage(),
      title: '热门',
    ),
    TabItemModel(
      page: ActivityPage(),
      title: '活动',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            HomeAppBar(tabs: _tabs),
          ];
        },
        body: TabBarView(
          children: _tabs.map((e) => e.page).toList(),
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key key,
    @required List<TabItemModel> tabs,
  })  : _tabs = tabs,
        super(key: key);

  final List<TabItemModel> _tabs;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 1,
      pinned: true,
      leading: Padding(
        padding: const EdgeInsets.all(14.0),
        child: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.grey[300],
        ),
      ),
      centerTitle: true,
      title: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          color: Color(0xFFF4F4F4),
          height: 30,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.mail_outline,
            color: Color(0xFF757575),
            size: 28,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return MessagePage();
                },
              ),
            );
          },
        ),
      ],
      bottom: TabBar(
        tabs: _tabs.map((e) => Tab(text: e.title)).toList(),
        labelStyle: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
