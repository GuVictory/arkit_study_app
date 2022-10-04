import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:arkit_plugin/arkit_plugin.dart';

class HelloWorldScreen extends StatefulWidget {
  const HelloWorldScreen({super.key});

  @override
  State<HelloWorldScreen> createState() => _HelloWorldScreenState();
}

class _HelloWorldScreenState extends State<HelloWorldScreen> {
  ARKitController? _arKitController;

  @override
  void dispose() {
    super.dispose();
    _arKitController?.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Hello, World!'),
        ),
        body: Container(
            child: ARKitSceneView(
          onARKitViewCreated: createARView,
        )),
      );

  void createARView(ARKitController arKitController) {
    _arKitController = arKitController;

    _arKitController?.add(createARText());
  }

  createARText() {
    final txt = ARKitText(
      text: 'Hello, world!',
      extrusionDepth: 1,
      materials: [
        ARKitMaterial(diffuse: ARKitMaterialProperty.color(Colors.purple)),
      ],
    );

    return ARKitNode(
      geometry: txt,
      position: vector.Vector3(-0.3, 0.3, -1.4),
      scale: vector.Vector3(0.05, 0.05, 0.05),
    );
  }
}
