import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wtbrowser/component_registry.dart';

class ComponentDetailPage extends StatelessWidget {
  final String name;

  const ComponentDetailPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    // Get the component page from the registry
    final componentPageBuilder =
        componentRegistry[name.replaceAll('.dart', '')];

    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body:
          componentPageBuilder != null
              ? componentPageBuilder() // Load the component page
              : const Center(
                child: Text('No preview available for this component.'),
              ),
    );
  }
}
