import 'package:app_lab_flutter/file_folder/node_tree.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'node_generator.dart';

class Node {
  final int id;
  final String name;
  final int parentId;
  final DateTime createdTime;

  bool isFolder;
  List<Node> children;

  Node(
    this.id, {
    @required this.name,
    @required this.parentId,
    @required this.createdTime,
    this.isFolder = false,
    this.children,
  }) {
    if (isFolder) {
      children ??= [];
    }
  }

  String get timeString {
    return DateFormat("MM-dd HH:mm:ss").format(createdTime);
  }

  Future<void> fetchChildren() async {
    if (!isFolder) {
      return;
    }
    await Future.delayed(Duration(milliseconds: 300));
    children = generateChildren(id);
    NodeTree.getInstance().streamController.add(this);
  }

  Future<void> fetchMoreChildren() async {
    if (!isFolder) {
      return;
    }
    await Future.delayed(Duration(milliseconds: 300));
    final nodes = List.generate(10, (index) {
      final id = index + parentId + children.length;
      return Node(
        id,
        name: '照片 $id',
        parentId: id,
        createdTime: DateTime.now(),
      );
    });

    children += nodes;
    NodeTree.getInstance().streamController.add(this);
  }

  Future<void> addChildFolder() async {
    if (!isFolder) {
      return;
    }
    await Future.delayed(Duration(milliseconds: 300));
    final id = parentId + children.length;
    final folder = Node(
      id,
      name: '文件夹 $id',
      parentId: id,
      createdTime: DateTime.now(),
      isFolder: true,
    );
    children.insert(0, folder);
    NodeTree.getInstance().streamController.add(this);
  }

  void remove(Node child) {
    children.remove(child);
    NodeTree.getInstance().streamController.add(this);
  }
}
