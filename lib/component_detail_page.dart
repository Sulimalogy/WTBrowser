import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wtbrowser/component_registry.dart';
import 'package:wtbrowser/localization.dart';

class ComponentDetailPage extends StatelessWidget {
  final String name;

  const ComponentDetailPage({super.key, required this.name});
  /*Future<void> _switchLocale() async {
    setState(() {
      _currentLocale =
          _currentLocale.languageCode == 'en'
              ? const Locale('ar', '')
              : const Locale('en', '');
    });

    // Save the selected locale to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', _currentLocale.languageCode);
    return null;
  }*/

  @override
  Widget build(BuildContext context) {
    // Get the component page from the registry
    final componentPageBuilder =
        componentRegistry[name.replaceAll('.dart', '')];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate(name.replaceAll('.dart', '')),
        ),
        /*actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: onLocaleSwitch, // Call the locale switch function
          ),
        ],*/
      ),
      body:
          componentPageBuilder != null
              ? componentPageBuilder() // Load the component page
              : Center(
                child: Text(
                  AppLocalizations.of(context).translate('not_found'),
                ),
              ),
    );
  }
}
