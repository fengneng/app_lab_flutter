import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'node.dart';
import 'node_container.dart';

class FileFolderPage extends StatefulWidget {
  final Node node;

  const FileFolderPage(
    this.node, {
    Key key,
  }) : super(key: key);

  @override
  _FileFolderPageState createState() => _FileFolderPageState();
}

class _FileFolderPageState extends State<FileFolderPage> {
  bool _loadMoreLock = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(widget.node.name),
        elevation: 1,
      ),
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            _loadMoreLock = false;
          }
          if (notification is ScrollUpdateNotification) {
            if (!_isLoading &&
                !_loadMoreLock &&
                notification.metrics.axisDirection == AxisDirection.down) {
              final maxScroll = notification.metrics.maxScrollExtent;
              final currentScroll = notification.metrics.pixels;
              if (currentScroll > 0 && maxScroll - currentScroll <= 200) {
                _loadMoreLock = true;
                _isLoading = true;
                widget.node.fetchMoreChildren().then((value) {
                  _isLoading = false;
                });
              }
            }
          }
          return false;
        },
        child: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            if (widget.node.isFolder)
              CupertinoSliverRefreshControl(onRefresh: () {
                return widget.node.fetchChildren();
              }),
            NodeContainer(node: widget.node),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.node.addChildFolder();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
