import 'dart:math';

import 'package:binary_tree_visualizer/src/binary_tree/binary_tree.dart';
import 'package:binary_tree_visualizer/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class BinaryTreeVisualizerPage extends StatefulWidget {
  const BinaryTreeVisualizerPage({super.key});

  @override
  State<BinaryTreeVisualizerPage> createState() =>
      _BinaryTreeVisualizerPageState();
}

class _BinaryTreeVisualizerPageState extends State<BinaryTreeVisualizerPage> {
  final numbers = [10, 8, 16, 4, 9, 13, 25, 2, 6, 12, 26, 14, 18];
  //[50, 40, 60, 30, 45, 55, 65, 20, 35, 51, 58];
  final binaryTree = BinaryTree();
  final nodes = <TreeNode>[];

  @override
  void initState() {
    super.initState();
    initTree();
  }

  void initTree() {
    for (var value in numbers) {
      binaryTree.addNode(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomPaint(
      painter: BinaryTreePainter(numbers),
      child: const SizedBox.expand(),
    ));
  }
}

class BinaryTreePainter extends CustomPainter {
  BinaryTreePainter(this.numbers);
  final List<num> numbers;
  TreeNode? root;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5;
    final circlePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    double circleXStartPoint = size.width / 2;
    double cirleYStartPoint = min(size.height * 0.12, 100);
    double lineHeight = cirleYStartPoint;
    const double cirlceDifference = 60;
    const double circleRadius = 35;
    const double textSpacing = 20;
    int leftInc = 1;
    int rightInc = 1;

    for (var i = 0; i < numbers.length; i++) {
      final value = numbers[i];
      final treeNode = TreeNode(value);
      if (root == null) {
        root = treeNode;
        canvas.drawNode(
          offset: Offset(circleXStartPoint, cirleYStartPoint),
          nodePaint: circlePaint,
          nodeRadius: circleRadius,
          nodeLineHeight: lineHeight,
          nodeDifference: cirlceDifference,
          text: treeNode.value.toString(),
          textSpaing: textSpacing,
          increment: i,
          nodeType: NodeType.root,
        );
      } else {
        var currentNode = root;
        while (true) {
          if (currentNode!.value > value) {
            if (currentNode.left == null) {
              currentNode.left = treeNode;
              print("left: ${treeNode.value}");

              double newXLeftStartingPoint =
                  circleXStartPoint - (cirlceDifference * leftInc);
              canvas.drawNewNode(
                offset: Offset(newXLeftStartingPoint, cirleYStartPoint),
                nodePaint: circlePaint,
                nodeRadius: circleRadius,
                nodeLineHeight: lineHeight,
                nodeDifference: cirlceDifference,
                text: treeNode.value.toString(),
                textSpaing: textSpacing,
                increment: leftInc,
                nodeType: NodeType.left,
                i: i,
              );
              leftInc++;
              break;
            }
            currentNode = currentNode.left;
          } else {
            if (currentNode.right == null) {
              currentNode.right = treeNode;
              print("right: ${treeNode.value}");
              double newXRightStartingPoint =
                  circleXStartPoint + (cirlceDifference * rightInc);
              canvas.drawNewNode(
                offset: Offset(newXRightStartingPoint, cirleYStartPoint),
                nodePaint: circlePaint,
                nodeRadius: circleRadius,
                nodeLineHeight: lineHeight,
                nodeDifference: cirlceDifference,
                text: treeNode.value.toString(),
                textSpaing: textSpacing,
                increment: rightInc,
                nodeType: NodeType.right,
                i: i,
              );
              rightInc++;
              break;
            }
            currentNode = currentNode.right;
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
