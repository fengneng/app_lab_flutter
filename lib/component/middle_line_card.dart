import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MiddleLineCard extends StatelessWidget {
  const MiddleLineCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114,
      padding: EdgeInsets.only(left: 12, top: 12, bottom: 12),
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 10,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          'https://i0.hdslb.com/bfs/archive/ec6226dc1e506551dc1ca7a43529d4e48b1b1cee.jpg@412w_232h_1c_100q.jpg',
                      placeholder: (context, url) {
                        return Container();
                      },
                    ),
                  ),
                  Positioned(
                    right: 4,
                    bottom: 4,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: Text(
                        '13:20',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          height: 10 / 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '圣玛利亚大教堂：粗野主义 - 混凝土甚于严冬的凛冽',
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff212121),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '罗伯特文丘里',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 13,
                        height: 13 / 13,
                        color: Color(0xff999999),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '12.9万观看·10-11',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 13,
                        height: 13 / 13,
                        color: Color(0xff999999),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12),
            ],
          ),
          Positioned(
            bottom: -6,
            right: 12,
            child: SizedBox(
              width: 30,
              height: 30,
              child: CupertinoButton(
                padding: EdgeInsets.only(left: 8, top: 4),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 300,
                          color: Colors.white30,
                        );
                      });
                },
                child: Icon(
                  Icons.more_vert,
                  color: Color(0xffcccccc),
                  size: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
