import 'package:flutter/material.dart';

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  @override
  final double maxExtent;
  @override
  final double minExtent;
  StickyTabBarDelegate({
    @required this.child,
    @required this.maxExtent,
    @required this.minExtent,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
