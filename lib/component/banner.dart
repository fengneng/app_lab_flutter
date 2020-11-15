import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Swiper(
        itemCount: 4,
        autoplay: true,
        pagination: SwiperPagination(
          alignment: Alignment.bottomRight,
          builder: DotSwiperPaginationBuilder(
            size: 6,
            activeSize: 6,
            color: Colors.white.withAlpha(80),
            activeColor: Colors.white,
          ),
        ),
        itemBuilder: (BuildContext context, int index) {
          final urls = [
            'https://i0.hdslb.com/bfs/live/new_room_cover/45f1118be51540379e24d7962ed6cd54580aea5a.jpg',
            'https://i0.hdslb.com/bfs/archive/9d51f0e58f34380736f2568e22c651187aedabb5.jpg',
            'https://i0.hdslb.com/bfs/archive/89274f380e9d84dc75e3567530394befa1659b42.jpg',
            'https://i0.hdslb.com/bfs/live/new_room_cover/28be2fe864beced9a7299232dfdfe7c5639ba263.jpg',
          ];
          return CachedNetworkImage(
            imageUrl: urls[index],
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              child: Container(
                color: Colors.grey[300],
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          );
        },
      ),
    );
  }
}
