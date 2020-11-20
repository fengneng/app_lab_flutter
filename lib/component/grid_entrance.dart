import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class GridEntrance extends StatelessWidget {
  const GridEntrance({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Swiper(
        itemCount: 2,
        autoplay: false,
        loop: false,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            size: 6,
            activeSize: 6,
            color: Colors.grey,
            activeColor: Colors.black,
          ),
        ),
        itemBuilder: (context, index) {
          return GridView.count(
            padding: EdgeInsets.all(8),
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1,
            children: List.generate(8, (index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.home,
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    size: 44,
                  ),
                  SizedBox(height: 4),
                  Text('热销$index'),
                ],
              );
            }),
          );
        },
      ),
    );
  }
}
