import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../moments/bloc/follow_bloc.dart';
import '../moments/user.dart';

class MomentCard extends StatelessWidget {
  final User user;

  const MomentCard(
    this.user, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 40,
                height: 40,
                child: CircleAvatar(),
              ),
              SizedBox(
                width: 6,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '少林武当侠客 ${user.id}',
                      style: TextStyle(
                        color: Color(0xff212121),
                        fontFamily: 'PingFangSC-Medium',
                        height: 1,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      '一位正直的人',
                      style: TextStyle(
                        color: Color(0xff999999),
                        fontFamily: 'PingFangSC-Medium',
                        height: 1,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<FollowBloc, FollowState>(
                buildWhen: (previous, current) {
                  return current is FollowChanged && current.id == user.id;
                },
                builder: (context, state) {
                  bool isFollowed;
                  if (state is FollowChanged) {
                    final ids = context.read<FollowBloc>().followIds;
                    isFollowed = ids.contains(user.id);
                  } else {
                    isFollowed = user.followed;
                  }
                  log('$state ${user.id} : $isFollowed');
                  return OutlineButton.icon(
                    textColor: Color(0xfffb7299),
                    borderSide: BorderSide(
                      color: Color(0xfffb7299),
                    ),
                    onPressed: () {
                      context.read<FollowBloc>().add(isFollowed
                          ? UnFollowUser(user.id)
                          : FollowUser(user.id));
                      user.followed = !isFollowed;
                    },
                    padding: EdgeInsets.zero,
                    icon: Icon(isFollowed ? Icons.rotate_right : Icons.add),
                    label: Text(isFollowed ? '已关注' : '关注'),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '过去几年以来，Netflix 一直在开发 Prodicle 移动应用，借此在电视节目与电影制作领域推进创新。时至今日，实体生产的具体方式可谓日新月异，不同国家、地区甚至是不同生产体系之间都存在着巨大的方法与需求层面的差异。',
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xff212121),
              fontWeight: FontWeight.normal,
              height: 23 / 16,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: CachedNetworkImage(
              imageUrl:
                  'https://i1.hdslb.com/bfs/archive/2e3716d82cef0ca13dac4ff7517f681701faff06.png@640w_400h.png',
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[300],
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            '这里是视频标题只显示一行不做行处',
            style: TextStyle(
              color: Color(0xff212121),
              fontWeight: FontWeight.w500,
              height: 21 / 14,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.transform),
                label: Text('分享'),
                onPressed: () {},
              ),
              Spacer(),
              FlatButton.icon(
                icon: Icon(Icons.insert_comment),
                label: Text('评论'),
                onPressed: () {},
              ),
              Spacer(),
              FlatButton.icon(
                icon: Icon(Icons.favorite_border),
                label: Text('点赞'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
