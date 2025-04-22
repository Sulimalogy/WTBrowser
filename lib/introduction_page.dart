import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wtflutter/metadata.dart';
import 'localization.dart'; // Import localization helper

class IntroductionPage extends StatelessWidget {
  final VoidCallback onLocaleSwitch;

  const IntroductionPage({super.key, required this.onLocaleSwitch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('introduction')),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: onLocaleSwitch, // Call the locale switch function
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1. App Logo or Icon
              SvgPicture.asset('icon.svg', height: 100, width: 100),
              const SizedBox(height: 20),

              // 2. Welcome Message
              Text(
                AppLocalizations.of(context).translate('welcome_message'),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              // Display component statistics with localization
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                  children: [
                    TextSpan(
                      text:
                          '${AppLocalizations.of(context).translate('total_components')}: ',
                    ),
                    TextSpan(
                      text: '${ComponentMetadata.totalComponents}\n',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          '${AppLocalizations.of(context).translate('working_components')}: ',
                    ),
                    TextSpan(
                      text: '${ComponentMetadata.workingComponents}\n',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          '${AppLocalizations.of(context).translate('failed_components')}: ',
                    ),
                    TextSpan(
                      text: '${ComponentMetadata.failedComponents}\n',
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          '${AppLocalizations.of(context).translate('last_modified')}: ',
                    ),
                    TextSpan(
                      text: ComponentMetadata.lastModifiedDate,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // 3. Purpose of the Application
              Text(
                AppLocalizations.of(context).translate('purpose_message'),
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // 4. Key Features
              Text(
                AppLocalizations.of(context).translate('key_features'),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• ${AppLocalizations.of(context).translate('feature_browse_components')}',
                    ),
                    Text(
                      '• ${AppLocalizations.of(context).translate('feature_preview_components')}',
                    ),
                    Text(
                      '• ${AppLocalizations.of(context).translate('feature_access_docs')}',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // 5. How to Navigate
              Text(
                AppLocalizations.of(context).translate('how_to_navigate'),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                AppLocalizations.of(
                  context,
                ).translate('navigation_instructions'),
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // 6. Localization
              Text(
                AppLocalizations.of(context).translate('localization'),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                AppLocalizations.of(
                  context,
                ).translate('localization_instructions'),
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // 7. Version Information
              Text(
                '${AppLocalizations.of(context).translate('version')}: 1.0.0',
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),

              // 8. Contact or Support Information
              /*Text(
                AppLocalizations.of(context).translate('support_message'),
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),*/

              // 9. Acknowledgments (Optional)
              Text(
                AppLocalizations.of(context).translate('acknowledgments'),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                AppLocalizations.of(
                  context,
                ).translate('acknowledgments_message'),
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // 10. Call to Action
              Text(
                AppLocalizations.of(context).translate('call_to_action'),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
