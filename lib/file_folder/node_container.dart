import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'node.dart';
import 'node_item_widget.dart';
import 'node_tree.dart';

class NodeContainer extends StatefulWidget {
  final Node node;

  const NodeContainer({
    Key key,
    @required this.node,
  }) : super(key: key);

  @override
  _NodeContainerState createState() => _NodeContainerState();
}

class _NodeContainerState extends State<NodeContainer> {
  bool isLoading = false;

  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    if (widget.node.isFolder) {
      if (widget.node.children.isEmpty) {
        isLoading = true;
        widget.node.fetchChildren().then((value) {
          isLoading = false;
        });
      }
      _subscription = NodeTree.getInstance().updateStream().where((event) {
        return widget.node == event || widget.node.children.contains(event);
      }).listen((event) {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SliverFillRemaining(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 200.0),
            child: CupertinoActivityIndicator(),
          ),
        ),
      );
    }
    final node = widget.node;
    if (!node.isFolder) {
      return SliverFillRemaining(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 200.0),
            child: Icon(
              Icons.photo,
              size: 150,
              color: Colors.blue,
            ),
          ),
        ),
      );
    }
    if (node.children == null || node.children.isEmpty) {
      return SliverFillRemaining(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 200.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.assessment,
                  size: 100,
                  color: Colors.grey,
                ),
                Text(
                  '空文件夹',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
      );
    }
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final itemNode = node.children[index];
            return NodeItemWidget(
              itemNode: itemNode,
              onDeleted: () {
                node.remove(itemNode);
              },
            );
          },
          childCount: node.children.length,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.9,
        ),
      ),
    );
  }
}
