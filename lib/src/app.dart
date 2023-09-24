import 'package:binary_tree_visualizer/src/binary_tree/binary_tree.dart';
import 'package:flutter/material.dart';

class VisualizerApp extends StatelessWidget {
  const VisualizerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      home: const BinaryTreeVisualizerPage(),
    );
  }
}
