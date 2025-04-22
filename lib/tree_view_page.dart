import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wtbrowser/component_detail_page.dart';
import 'package:wtflutter/generate_structure.dart';
import 'localization.dart';
import 'introduction_page.dart';
import 'get_started_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wtflutter/metadata.dart';

class TreeViewPage extends StatefulWidget {
  final VoidCallback onLocaleSwitch;

  const TreeViewPage({super.key, required this.onLocaleSwitch});

  @override
  State<TreeViewPage> createState() => _TreeViewPageState();
}

class _TreeViewPageState extends State<TreeViewPage> {
  Future<Locale> _loadLocaleFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode =
        prefs.getString('locale') ?? 'en'; // Default to English
    return Locale(languageCode, '');
  }

  late Locale _currentLocale;

  @override
  void initState() {
    super.initState();
    _initializeLocale();
  }

  Future<void> _initializeLocale() async {
    _currentLocale = await _loadLocaleFromStorage();
    print('Current locale: ${_currentLocale.languageCode}');
    setState(() {});
  }

  int _getTotalCount(Map<String, List<String>> categoryData) {
    return categoryData.values.fold(0, (sum, items) => sum + items.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 300,
            color: Colors.blue.shade50,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Display the SVG icon
                            SvgPicture.asset(
                              'icon.svg',
                              height: 50, // Adjust the size as needed
                              width: 50,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              AppLocalizations.of(
                                context,
                              ).translate('welcome_message'),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo', // Use Cairo font locally
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),

                            // Display component statistics
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                                children: [
                                  TextSpan(
                                    text: AppLocalizations.of(
                                      context,
                                    ).translate('total_components'),
                                  ),
                                  TextSpan(
                                    text:
                                        '${ComponentMetadata.totalComponents}\n',
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: AppLocalizations.of(
                                      context,
                                    ).translate('working_components'),
                                  ),
                                  TextSpan(
                                    text:
                                        '${ComponentMetadata.workingComponents}\n',
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          'Cairo', // Use Cairo font locally
                                    ),
                                  ),
                                  TextSpan(
                                    text: AppLocalizations.of(
                                      context,
                                    ).translate('failed_components'),
                                  ),
                                  TextSpan(
                                    text:
                                        '${ComponentMetadata.failedComponents}\n',
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          'Cairo', // Use Cairo font locally
                                    ),
                                  ),
                                  TextSpan(
                                    text: AppLocalizations.of(
                                      context,
                                    ).translate('last_modified'),
                                  ),
                                  TextSpan(
                                    text: ComponentMetadata.lastModifiedDate,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.italic,
                                      fontFamily:
                                          'Cairo', // Use Cairo font locally
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Text(
                          AppLocalizations.of(
                            context,
                          ).translate('introduction'),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => IntroductionPage(
                                    onLocaleSwitch:
                                        widget
                                            .onLocaleSwitch, // Pass the locale switch function
                                  ),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        title: Text(
                          AppLocalizations.of(context).translate('get_started'),
                          style: const TextStyle(
                            fontFamily: 'Cairo', // Use Cairo font locally
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GetStartedPage(),
                            ),
                          );
                        },
                      ),
                      ExpansionTile(
                        // subtitle
                        // trailing
                        initiallyExpanded: true,
                        title: Text(
                          AppLocalizations.of(context).translate('components'),
                          style: const TextStyle(
                            fontFamily: 'Cairo', // Use Cairo font locally
                          ),
                        ),
                        children:
                            structure.entries.map((category) {
                              final categoryName = category.key;
                              final categoryData = category.value;

                              return ExpansionTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(
                                        context,
                                      ).translate(categoryName),
                                      style: const TextStyle(
                                        fontWeight:
                                            FontWeight
                                                .bold, // Make the main category bold
                                        fontSize:
                                            16, // Optional: Adjust font size for better visibility
                                      ),
                                    ),
                                    Text(
                                      ' (${_getTotalCount(categoryData)})', // Display the count of components
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily:
                                            'Cairo', // Use Cairo font locally
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                children:
                                    categoryData.entries.map((entry) {
                                      final entryName = entry.key.replaceAll(
                                        '.dart',
                                        '',
                                      );
                                      final entryItems = entry.value;

                                      return ExpansionTile(
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              AppLocalizations.of(
                                                context,
                                              ).translate(entryName),
                                            ),
                                            Text(
                                              '(${entryItems.length})', // Display the count of components in the subcategory
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontFamily:
                                                    'Cairo', // Use Cairo font locally
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        children:
                                            entryItems.map((item) {
                                              return ListTile(
                                                title: Text(
                                                  AppLocalizations.of(
                                                    context,
                                                  ).translate(
                                                    item.replaceAll(
                                                      '.dart',
                                                      '',
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder:
                                                          (
                                                            context,
                                                          ) => ComponentDetailPage(
                                                            //  category: categoryName,
                                                            // type: entryName,
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
                    ],
                  ),
                ),
                // Version Text
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Version 0.1.0',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ),
                // Locale Switch Button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton.icon(
                    onPressed: widget.onLocaleSwitch,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 15, 127, 255),
                      iconColor: const Color.fromARGB(255, 15, 127, 255),
                      backgroundColor: const Color.fromARGB(255, 236, 245, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(Icons.language),
                    label: Text(
                      AppLocalizations.of(context).translate('switch_locale'),
                    ),
                  ),
                ),
                // Copyright Text
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '© 2025 Sulimalogy',
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color.fromARGB(255, 236, 243, 255),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          // Main Content Area
          Expanded(
            child: Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  AppLocalizations.of(context).translate('select_a_page'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
