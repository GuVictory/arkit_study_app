import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:arkit_plugin/arkit_plugin.dart';

class PlaneScreen extends StatefulWidget {
  const PlaneScreen({super.key});

  @override
  State<PlaneScreen> createState() => _PlaneScreenState();
}

class _PlaneScreenState extends State<PlaneScreen> {
  ARKitController? _arKitController;

  @override
  void dispose() {
    super.dispose();
    _arKitController?.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Plane'),
        ),
        body: Container(
            child: ARKitSceneView(
          onARKitViewCreated: createARView,
        )),
      );

  void createARView(ARKitController arKitController) {
    _arKitController = arKitController;

    _arKitController?.add(createPlane());
  }

  ARKitNode createPlane() {
    final txt = ARKitPlane(width: 1, height: 1, materials: [
      ARKitMaterial(
        transparency: 0.5,
        diffuse: ARKitMaterialProperty.color(Colors.greenAccent),
      )
    ]);

    return ARKitNode(
      geometry: txt,
      position: vector.Vector3(0, 0, -1.5),
    );
  }
}
