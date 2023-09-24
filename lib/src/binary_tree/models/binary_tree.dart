import 'package:binary_tree_visualizer/src/binary_tree/binary_tree.dart';

class BinaryTree {
  BinaryTree([this.root]);
  TreeNode? root;

  void addNode(num value) {
    final treeNode = TreeNode(value);
    if (root == null) {
      root = treeNode;
    } else {
      var currentNode = root;
      while (1 == 1) {
        if (currentNode!.value > value) {
          if (currentNode.left == null) {
            currentNode.left = treeNode;
            break;
          }
          currentNode = currentNode.left;
        } else {
          if (currentNode.right == null) {
            currentNode.left = treeNode;
            break;
          }
          currentNode = currentNode.right;
        }
      }
    }
  }
}
