import 'package:flutter/material.dart';
import 'package:wtflutter/generate_structure.dart'; // Import the structure map
import 'component_detail_page.dart';

class TreeViewPage extends StatelessWidget {
  const TreeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Component Browser')),
      body: ListView(
        children:
            structure.entries.map((category) {
              final categoryName = category.key;
              final categoryData = category.value;

              return ExpansionTile(
                title: Text('$categoryName (${_getTotalCount(categoryData)})'),
                children:
                    categoryData.entries.map((entry) {
                      final entryName = entry.key;
                      final entryItems = entry.value;

                      return ExpansionTile(
                        title: Text('$entryName (${entryItems.length})'),
                        children:
                            entryItems.map((item) {
                              return ListTile(
                                title: Text(item),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => ComponentDetailPage(
                                            category: categoryName,
                                            type: entryName,
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

  /// Helper function to calculate the total count of items in a category
  int _getTotalCount(Map<String, List<String>> categoryData) {
    return categoryData.values.fold(0, (sum, items) => sum + items.length);
  }
}
