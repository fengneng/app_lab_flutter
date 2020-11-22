import 'dart:math';

import 'node.dart';

List<Node> generateChildren(int parentId) {
  final nodes = List.generate(1 + Random().nextInt(3), (index) {
        final id = parentId + 1000 + index;
        return Node(
          id,
          name: '文件夹 $id',
          createdTime: DateTime.now(),
          parentId: parentId,
          isFolder: true,
          children: null,
        );
      }) +
      List.generate(2 + Random().nextInt(5), (index) {
        final id = parentId + 1000 + index;
        return Node(
          id,
          name: '照片 $id',
          parentId: parentId,
          createdTime: DateTime.now(),
          isFolder: false,
          children: null,
        );
      });
  return nodes;
}
