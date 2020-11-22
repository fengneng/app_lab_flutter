import 'package:app_lab_flutter/file_folder/node_container.dart';
import 'package:app_lab_flutter/file_folder/node_tree.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  final _node = NodeTree.getInstance().root;

  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('我的'),
            pinned: true,
            elevation: 1,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'images/IMG_201702122003.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          CupertinoSliverRefreshControl(onRefresh: () {
            return widget._node.fetchChildren();
          }),
          NodeContainer(node: widget._node),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget._node.addChildFolder();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
