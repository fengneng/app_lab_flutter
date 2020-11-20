import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

import 'client/client.dart';
import 'home/home_page.dart';
import 'mall/mall.dart';
import 'moments/moments.dart';
import 'pages/me.dart';
import 'tab_item_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Color(0x00f4f4f4),
        cardColor: Colors.white,
        tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: Color(0xFF757575),
          labelColor: Color(0xFFFB7299),
        ),
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<TabItemModel> _tabs = [
    TabItemModel(
      page: HomePage(),
      iconData: OMIcons.home,
      title: '首页',
    ),
    TabItemModel(
      page: MomentsPage(),
      iconData: OMIcons.palette,
      title: '动态',
    ),
    TabItemModel(
      page: MallPage(),
      iconData: Icons.card_travel,
      title: '购物车',
    ),
    TabItemModel(
      page: MePage(),
      iconData: OMIcons.person,
      title: '我的',
    ),
  ];

  int _tabIndex = 0;

  @override
  void initState() {
    client.fetchColumns('zhihuadmin').then((value) {
      log('$value');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_tabIndex].page,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xfffb7299),
        type: BottomNavigationBarType.fixed,
        items: _tabs.map((e) {
          return BottomNavigationBarItem(
            icon: Icon(e.iconData),
            title: Text(e.title),
          );
        }).toList(),
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}
