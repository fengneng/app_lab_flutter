import 'dart:async';

import 'node.dart';
import 'node_generator.dart';

class NodeTree {
  NodeTree._();
  static final _instance = NodeTree._();
  factory NodeTree.getInstance() => _instance;

  final StreamController<Node> streamController =
      StreamController<Node>.broadcast();

  Stream<Node> updateStream() => streamController.stream;

  Node root = Node(
    6001,
    name: '根目录',
    parentId: 0,
    createdTime: DateTime.now(),
    isFolder: true,
    children: generateChildren(6001),
  );
}
