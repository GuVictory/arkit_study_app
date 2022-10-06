import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart' as vector;

class GeometricShapesScreen extends StatefulWidget {
  const GeometricShapesScreen({super.key});

  @override
  State<GeometricShapesScreen> createState() => _GeometricShapesScreenState();
}

class _GeometricShapesScreenState extends State<GeometricShapesScreen> {
  ARKitController? _arKitController;

  @override
  void dispose() {
    super.dispose();
    _arKitController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello, World!'),
      ),
      body: ARKitSceneView(
        onARKitViewCreated: createARView,
      ),
    );
  }

  void createARView(ARKitController arKitController) {
    _arKitController = arKitController;

    createARGeometric().forEach((element) {
      _arKitController?.add(element);
    });
  }

  List<ARKitNode> createARGeometric() {
    return [
      ARKitNode(
        geometry:
            ARKitSphere(materials: _createRandomColorMaterial(), radius: 0.05),
        position: vector.Vector3(-0.3, 0.3, -0.4),
      ),
      ARKitNode(
        geometry: ARKitBox(
          materials: _createRandomColorMaterial(),
          width: 0.1,
          height: 0.1,
          length: 0.1,
        ),
        position: vector.Vector3(-0.1, 0.3, -0.4),
      ),
      ARKitNode(
        geometry: ARKitCylinder(
            materials: _createRandomColorMaterial(), radius: 0.05, height: 0.1),
        position: vector.Vector3(0.1, 0.3, -0.4),
      ),
      ARKitNode(
        geometry: ARKitCone(
            materials: _createRandomColorMaterial(),
            bottomRadius: 0.05,
            height: 0.1,
            topRadius: 0),
        position: vector.Vector3(0.3, 0.3, -0.4),
      ),
      ARKitNode(
        geometry: ARKitPyramid(
          materials: _createRandomColorMaterial(),
          height: 0.15,
          width: 0.1,
          length: 0.1,
        ),
        position: vector.Vector3(-0.3, 0, -0.4),
      ),
      ARKitNode(
        geometry: ARKitTube(
          materials: _createRandomColorMaterial(),
          height: 0.15,
          innerRadius: 0.03,
          outerRadius: 0.05,
        ),
        position: vector.Vector3(-0.1, 0.07, -0.4),
      ),
      ARKitNode(
        geometry: ARKitTorus(
          materials: _createRandomColorMaterial(),
          ringRadius: 0.05,
          pipeRadius: 0.02,
        ),
        position: vector.Vector3(0.1, 0.1, -0.4),
      ),
      ARKitNode(
        geometry: ARKitCapsule(
          materials: _createRandomColorMaterial(),
          height: 0.15,
          capRadius: 0.05,
        ),
        position: vector.Vector3(0.3, 0.07, -0.4),
      ),
    ];
  }

  List<ARKitMaterial> _createRandomColorMaterial() {
    return [
      ARKitMaterial(
          lightingModelName: ARKitLightingModel.physicallyBased,
          diffuse: ARKitMaterialProperty.color(
              Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
                  .withOpacity(1))),
    ];
  }
}
