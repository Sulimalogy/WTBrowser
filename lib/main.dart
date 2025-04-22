import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization.dart';
import 'tree_view_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _currentLocale = const Locale('ar', '');

  void _switchLocale() {
    setState(() {
      _currentLocale =
          _currentLocale.languageCode == 'ar'
              ? const Locale('ar', '')
              : const Locale('en', '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Component Browser',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cairo', // Set Cairo as the default font
      ),
      locale: _currentLocale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('ar', ''), // Arabic
      ],
      home: TreeViewPage(
        onLocaleSwitch: _switchLocale, // Pass the locale switch function
      ),
    );
  }
}
