import 'package:flutter/material.dart';

import 'package:app_lab_flutter/component/icon_text_button.dart';

import 'file_folder.dart';
import 'node.dart';

class NodeItemWidget extends StatelessWidget {
  const NodeItemWidget({
    Key key,
    @required this.itemNode,
    @required this.onDeleted,
  }) : super(key: key);

  final VoidCallback onDeleted;
  final Node itemNode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconTextButton(
              text: itemNode.name,
              iconColor: Colors.blue[500],
              iconData: itemNode.isFolder ? Icons.folder_open : Icons.photo,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FileFolderPage(itemNode),
                ));
              },
            ),
            Text(itemNode.timeString),
            if (itemNode.isFolder) Text('${itemNode.children.length}项'),
          ],
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: SizedBox(
            width: 20,
            height: 20,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onPressed: onDeleted,
            ),
          ),
        ),
      ],
    );
  }
}
