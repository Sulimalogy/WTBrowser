import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'localization.dart';
import 'tree_view_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Locale initialLocale = await _loadLocaleFromStorage();
  runApp(MyApp(initialLocale: initialLocale));
}

Future<Locale> _loadLocaleFromStorage() async {
  final prefs = await SharedPreferences.getInstance();
  final languageCode = prefs.getString('locale') ?? 'en'; // Default to English
  return Locale(languageCode, '');
}

class MyApp extends StatefulWidget {
  final Locale initialLocale;

  const MyApp({super.key, required this.initialLocale});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Locale _currentLocale;

  @override
  void initState() {
    super.initState();
    _currentLocale = widget.initialLocale;
  }

  Future<void> _switchLocale() async {
    setState(() {
      _currentLocale =
          _currentLocale.languageCode == 'en'
              ? const Locale('ar', '')
              : const Locale('en', '');
    });

    // Save the selected locale to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', _currentLocale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WT Components Browser',
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
