import 'package:flutter/material.dart';

enum NodeType { root, left, right }

extension CanvasExtension on Canvas {
  void drawText(Offset offset, String text) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter.paint(this, offset);
  }

  void drawNode({
    required Offset offset,
    required Paint nodePaint,
    required double nodeRadius,
    required double nodeLineHeight,
    required double nodeDifference,
    required String text,
    required double textSpaing,
    required int increment,
    required NodeType nodeType,
  }) {
    if (nodeType == NodeType.left) {
      drawLine(
          Offset(
              offset.dx + nodeDifference, offset.dy * increment + nodeRadius),
          Offset(offset.dx,
              ((offset.dy * increment) + nodeLineHeight) - nodeRadius),
          nodePaint);
    } else if (nodeType == NodeType.right) {
      drawLine(
          Offset(
              offset.dx - nodeDifference, offset.dy * increment + nodeRadius),
          Offset(offset.dx,
              ((offset.dy * increment) + nodeLineHeight) - nodeRadius),
          nodePaint);
    }

    //Draw Circle Node
    final circleOffset = Offset(offset.dx, (offset.dy * (increment + 1)));
    drawCircle(circleOffset, nodeRadius, nodePaint);

    //Draw node value
    drawText(
        Offset(offset.dx - (nodeRadius - textSpaing),
            (offset.dy * (increment + 1) - (nodeRadius - textSpaing))),
        text);
  }

  void drawNewNode({
    required Offset offset,
    required Paint nodePaint,
    required double nodeRadius,
    required double nodeLineHeight,
    required double nodeDifference,
    required String text,
    required double textSpaing,
    required int increment,
    required NodeType nodeType,
    int i = 1,
  }) {
    print(nodeType);
    if (nodeType == NodeType.left) {
      drawLine(
          Offset(
              offset.dx + nodeDifference, offset.dy * increment + nodeRadius),
          Offset(offset.dx,
              ((offset.dy * increment) + nodeLineHeight) - nodeRadius),
          nodePaint);
    } else if (nodeType == NodeType.right) {
      drawLine(
          Offset(
              offset.dx - nodeDifference, offset.dy * increment + nodeRadius),
          Offset(offset.dx,
              ((offset.dy * increment) + nodeLineHeight) - nodeRadius),
          nodePaint);
    } else {
      drawLine(
          Offset(offset.dx - nodeDifference, offset.dy * i + nodeRadius),
          Offset(offset.dx, ((offset.dy * i) + nodeLineHeight) - nodeRadius),
          nodePaint);
    }

    //Draw Circle Node
    final circleOffset = Offset(offset.dx, offset.dy * (increment + 1));
    drawCircle(circleOffset, nodeRadius, nodePaint);

    //Draw node value
    drawText(
        Offset(offset.dx - (nodeRadius - textSpaing),
            (offset.dy * (increment + 1) - (nodeRadius - textSpaing))),
        text);
  }
}
