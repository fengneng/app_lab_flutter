import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../component/moment_card.dart';
import 'bloc/follow_bloc.dart';
import 'user.dart';

class MomentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FollowBloc(),
      child: _MomentsPage(),
    );
  }
}

class _MomentsPage extends StatefulWidget {
  @override
  _MomentsPageState createState() => _MomentsPageState();
}

class _MomentsPageState extends State<_MomentsPage> {
  List<User> _list = [];

  void _loadData() {
    final list = [
      User(103, followed: true),
      User(103, followed: true),
      User(104, followed: false),
      User(104, followed: false),
      User(104, followed: false),
      User(105, followed: false),
    ];
    final followedIds =
        _list.where((element) => element.followed).map((e) => e.id).toList();
    context.read<FollowBloc>().add(ResetFollowUsers(followedIds));
    setState(() {
      _list = list;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动态'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _loadData,
          )
        ],
      ),
      body: ListView.separated(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return MomentCard(_list[index]);
        },
        separatorBuilder: (context, index) {
          return Container(
            height: 10,
            color: Color(0xfff4f4f4),
          );
        },
      ),
    );
  }
}
