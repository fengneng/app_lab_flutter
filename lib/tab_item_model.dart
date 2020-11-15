import 'package:flutter/material.dart';

class TabItemModel {
  Widget page;
  String title;
  IconData iconData;

  TabItemModel({
    @required this.page,
    @required this.title,
    this.iconData,
  });
}
