import 'dart:math';

import 'package:app_lab_flutter/component/banner.dart';
import 'package:app_lab_flutter/component/grid_entrance.dart';
import 'package:app_lab_flutter/component/middle_line_card.dart';
import 'package:app_lab_flutter/component/sticky_tabbar_delegate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class RecPage extends StatelessWidget {
  const RecPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _tabs = ['推荐', '发现'];

    return DefaultTabController(
      length: _tabs.length,
      child: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: BannerCard(),
            ),
            SliverToBoxAdapter(
              child: Card(
                clipBehavior: Clip.antiAlias,
                color: Color(0xfff4f4f4),
                margin: EdgeInsets.all(8),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        'https://i1.hdslb.com/bfs/archive/9c4a6c355bf94b85b0997b75162a94d62bfe3844.jpg',
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: GridEntrance(),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: StickyTabBarDelegate(
                maxExtent: 45,
                minExtent: 45,
                child: Container(
                  color: Colors.white,
                  child: TabBar(
                    tabs: _tabs.map((e) => Tab(text: e)).toList(),
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: 100,
              itemBuilder: (context, index) {
                return MiddleLineCard();
              },
            ),
            StaggeredGridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: 10,
                gridDelegate:
                    SliverStaggeredGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 2,
                  staggeredTileBuilder: (index) {
                    if (index % 3 == 0) {
                      return StaggeredTile.fit(2);
                    }
                    return StaggeredTile.fit(1);
                  },
                ),
                itemBuilder: (context, index) {
                  return Container(
                    child: Text('$index'),
                    color: Colors.red,
                    height: 140 + Random().nextDouble() * 200,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
