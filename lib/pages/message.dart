import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('消息'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(top: 8),
        itemBuilder: (context, index) {
          return Slidable(
            secondaryActions: <Widget>[
              Container(
                height: 800,
                color: Colors.green,
                child: Text('a'),
              ),
              IconSlideAction(
                caption: 'More',
                color: Colors.grey.shade200,
                icon: Icons.more_horiz,
                onTap: () {},
                closeOnTap: false,
              ),
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () {},
              ),
            ],
            actionPane: SlidableDrawerActionPane(),
            child: ListTile(
              leading: AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      'https://i0.hdslb.com/bfs/archive/e465748ff650e9682f9f70318330c93577997141.jpg@412w_232h_1c_100q.jpg',
                  placeholder: (_, __) {
                    return Container(
                      color: Color(0xffc0c0c0),
                    );
                  },
                ),
              ),
              title: Text(
                '少林武当侠客',
                style: TextStyle(
                  color: Color(0xff212121),
                  fontFamily: 'PingFangSC-Medium',
                  height: 1,
                  fontSize: 15,
                ),
              ),
              subtitle: Text(
                '一位正直的人',
                style: TextStyle(
                  color: Color(0xff999999),
                  fontFamily: 'PingFangSC-Medium',
                  height: 1,
                  fontSize: 12,
                ),
              ),
              trailing: Text(
                '昨天',
                style: TextStyle(
                  color: Color(0xff999999),
                  fontFamily: 'PingFangSC-Medium',
                  height: 1,
                  fontSize: 12,
                ),
              ),
            ),
          );
        },
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }
}
