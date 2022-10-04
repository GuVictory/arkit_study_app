import 'package:flutter/material.dart';

import './hello_world_screen.dart';
import './plane_screen.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const HelloWorldScreen()))
                    },
                child: const Text('Hello, world!')),
            ElevatedButton(
                onPressed: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const PlaneScreen()))
                    },
                child: const Text('Plane')),
          ],
        ),
      ),
    );
  }
}
// CustomObjectPage