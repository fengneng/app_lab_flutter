import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../component/icon_text_button.dart';

class MePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('我的'),
            pinned: true,
            elevation: 1,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'images/IMG_201702122003.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1,
            children: List.generate(28, (index) {
              return IconTextButton(
                text: '$index 活动',
                iconColor: Colors.primaries[Random().nextInt(
                  Colors.primaries.length,
                )],
                iconData: Icons.folder,
              );
            }),
          ),
        ],
      ),
    );
  }
}
