/*import 'dart:io';
import 'package:flutter/material.dart';
import 'component_detail_page.dart';

class TreeViewPage extends StatefulWidget {
  const TreeViewPage({super.key});

  @override
  State<TreeViewPage> createState() => _TreeViewPageState();
}

class _TreeViewPageState extends State<TreeViewPage> {
  Map<String, Map<String, List<String>>> structure = {};

  @override
  void initState() {
    super.initState();
    _loadStructure();
  }

  Future<void> _loadStructure() async {
    final file = File('./lib/src/generate_structure.dart');
    final content = await file.readAsString();

    final regex = RegExp(
      r"'(.*?)': \{\s+'pages': \[(.*?)\],\s+'components': \[(.*?)\]",
      dotAll: true,
    );
    final matches = regex.allMatches(content);

    final parsedStructure = <String, Map<String, List<String>>>{};

    for (final match in matches) {
      final category = match.group(1)!;
      final pages =
          match
              .group(2)!
              .split(',')
              .map((e) => e.trim().replaceAll("'", ''))
              .toList();
      final components =
          match
              .group(3)!
              .split(',')
              .map((e) => e.trim().replaceAll("'", ''))
              .toList();

      parsedStructure[category] = {'Pages': pages, 'Components': components};
    }

    setState(() {
      structure = parsedStructure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Component Browser')),
      body:
          structure.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                children:
                    structure.entries.map((category) {
                      return ExpansionTile(
                        title: Text(category.key),
                        children:
                            category.value.entries.map((entry) {
                              return ExpansionTile(
                                title: Text(entry.key),
                                children:
                                    entry.value.map((item) {
                                      return ListTile(
                                        title: Text(item),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) =>
                                                      ComponentDetailPage(
                                                        category: category.key,
                                                        type: entry.key,
                                                        name: item,
                                                      ),
                                            ),
                                          );
                                        },
                                      );
                                    }).toList(),
                              );
                            }).toList(),
                      );
                    }).toList(),
              ),
    );
  }
}
*/
