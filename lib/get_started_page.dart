import 'package:flutter/material.dart';
import 'package:wtbrowser/localization.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('get_started')),
        /*actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: onLocaleSwitch, // Call the locale switch function
          ),
        ],*/
      ),

      body: Center(
        child: Text(AppLocalizations.of(context).translate('not_found')),
      ),
    );
  }
}
