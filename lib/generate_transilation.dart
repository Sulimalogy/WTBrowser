import 'dart:convert';
import 'dart:io';

void main() {
  const l10nDir = 'lib/l10n';
  const arFilePath = '$l10nDir/ar.json';
  const enFilePath = '$l10nDir/en.json';

  // Ensure the l10n directory exists
  final l10nDirectory = Directory(l10nDir);
  if (!l10nDirectory.existsSync()) {
    l10nDirectory.createSync(recursive: true);
  }

  // Load existing translations
  final arTranslations = _loadTranslations(arFilePath);
  final enTranslations = _loadTranslations(enFilePath);

  // Scan all Dart files in the lib directory
  final libDirectory = Directory('lib');
  final translateKeys = <String>{};

  for (final file in libDirectory.listSync(recursive: true)) {
    if (file is File && file.path.endsWith('.dart')) {
      final content = file.readAsStringSync();
      translateKeys.addAll(_extractTranslateKeys(content));
    }
  }

  // Add new keys to the translation files
  var addedKeys = 0;
  for (final key in translateKeys) {
    if (!arTranslations.containsKey(key)) {
      arTranslations[key] = key; // Default Arabic translation (same as key)
      addedKeys++;
    }
    if (!enTranslations.containsKey(key)) {
      enTranslations[key] = key; // Default English translation (same as key)
    }
  }

  // Save updated translations
  _saveTranslations(arFilePath, arTranslations);
  _saveTranslations(enFilePath, enTranslations);

  print('Translation keys added: $addedKeys');
}

/// Load translations from a JSON file
Map<String, String> _loadTranslations(String filePath) {
  final file = File(filePath);
  if (file.existsSync()) {
    final content = file.readAsStringSync();
    return Map<String, String>.from(json.decode(content));
  }
  return {};
}

/// Save translations to a JSON file
void _saveTranslations(String filePath, Map<String, String> translations) {
  final file = File(filePath);
  final encoder = const JsonEncoder.withIndent('  ');
  file.writeAsStringSync(encoder.convert(translations));
}

/// Extract keys passed to translate('...') from Dart file content
Set<String> _extractTranslateKeys(String content) {
  final regex = RegExp(r"translate\('([^']+)'\)");
  return regex.allMatches(content).map((match) => match.group(1)!).toSet();
}
