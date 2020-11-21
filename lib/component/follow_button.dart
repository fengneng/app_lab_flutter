import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../moments/bloc/follow_bloc.dart';
import '../moments/user.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowBloc, FollowState>(
      buildWhen: (previous, current) {
        return current is FollowChanged && current.id == user.id;
      },
      builder: (context, state) {
        bool isFollowed;
        if (state is FollowChanged) {
          final ids = context.watch<FollowBloc>().followIds;
          isFollowed = ids.contains(user.id);
        } else {
          isFollowed = user.followed;
        }
        return OutlineButton.icon(
          textColor: Color(0xfffb7299),
          borderSide: BorderSide(
            color: Color(0xfffb7299),
          ),
          onPressed: () {
            context
                .read<FollowBloc>()
                .add(isFollowed ? UnFollowUser(user.id) : FollowUser(user.id));
            user.followed = !isFollowed;
          },
          padding: EdgeInsets.zero,
          icon: Icon(isFollowed ? Icons.rotate_right : Icons.add),
          label: Text(isFollowed ? '已关注' : '关注'),
        );
      },
    );
  }
}
