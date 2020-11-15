import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallCoverItem {
  String id;
  bool liked = false;
  SmallCoverItem(this.id, this.liked);
}

class SmallCoverCard extends StatefulWidget {
  final SmallCoverItem item;
  const SmallCoverCard({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  _SmallCoverCardState createState() => _SmallCoverCardState(item);
}

class _SmallCoverCardState extends State<SmallCoverCard> {
  final SmallCoverItem item;

  _SmallCoverCardState(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl:
                      'https://i0.hdslb.com/bfs/archive/e465748ff650e9682f9f70318330c93577997141.jpg@412w_232h_1c_100q.jpg',
                  placeholder: (_, __) {
                    return Container(
                      color: Color(0xffc0c0c0),
                    );
                  },
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    child: Text(
                      '热点',
                      style: TextStyle(
                        color: Color(0xffff6633),
                        fontSize: 11,
                        height: 16 / 11,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xfffff1ed),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 30,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.play_arrow,
                          size: 16,
                          color: Colors.white,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '19.6万',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            height: 16 / 10,
                          ),
                        ),
                        SizedBox(width: 12),
                        Icon(
                          Icons.playlist_add,
                          size: 16,
                          color: Colors.white,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '530',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            height: 16 / 10,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '02:33',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            height: 16 / 10,
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x0),
                          Color(0xff212121),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8.0, left: 8, right: 8, bottom: 0),
              child: Text(
                '基本上根据这些属性名字就能看出这些属性都是干啥的，这里面咱只看fit这个东西，这里有专门讲解这一块用法的一个文章image',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: Color(0xff212121),
                  fontSize: 13,
                  height: 16 / 13,
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 8, right: 4, bottom: 8, top: 8),
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                child: Text(
                  '热点',
                  style: TextStyle(
                    color: Color(0xfffb7299),
                    fontSize: 10,
                    height: 16 / 10,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xfffb7299), width: 0.5),
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 4, bottom: 8, top: 8),
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                child: Text(
                  '国创',
                  style: TextStyle(
                    color: Color(0xffff6633),
                    fontSize: 11,
                    height: 16 / 11,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xfffff1ed),
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 16,
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Text(
                        '基本上根据这些属性名字就能看出这些属性都是干啥的，这里面咱只看fit这个东西，这里有专门讲解这一块用法的一个文章image',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 12,
                          height: 16 / 12,
                        )),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: CupertinoButton(
                  padding: EdgeInsets.only(left: 8, top: 4),
                  onPressed: () {},
                  child: Icon(
                    Icons.more_vert,
                    color: Color(0xffcccccc),
                    size: 16,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
