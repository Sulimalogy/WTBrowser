import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:wtflutter/wtflutter.dart'; // Example component import

class ComponentDetailPage extends StatelessWidget {
  final String category;
  final String type;
  final String name;

  const ComponentDetailPage({
    super.key,
    required this.category,
    required this.type,
    required this.name,
  });

  Future<String> _loadDocumentation() async {
    final filePath =
        'lib/docs/${type.toLowerCase()}/${category.toLowerCase()}/$name.md';
    try {
      return await rootBundle.loadString(filePath);
    } catch (e) {
      return '# Documentation not found\n\nNo documentation available for `$name`.';
    }
  }

  Widget _buildPreview() {
    if (name == 'login_form.dart') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Preview 1: Default Configuration',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          CustomLoginForm(
            httpService: HttpService(baseUrl: 'https://api.example.com'),
            allowedLoginTypes: [LoginType.email, LoginType.social],
            socialProviders: ['Google', 'Facebook'],
            onEmailLogin: (email, password) {
              print('Email Login: $email, $password');
            },
            onSocialLogin: (provider) {
              print('Social Login with $provider');
            },
            onForgotPassword: () {
              print('Forgot Password Clicked');
            },
            onSignup: () {
              print('Sign Up Clicked');
            },
          ),
          const SizedBox(height: 16),
          const Text(
            'Preview 2: With Social Login Enabled',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          CustomLoginForm(
            httpService: HttpService(baseUrl: 'https://api.example.com'),
            allowedLoginTypes: [LoginType.email, LoginType.social],
            socialProviders: ['Google', 'Facebook'],
            onEmailLogin: (email, password) {
              print('Email Login: $email, $password');
            },
            onSocialLogin: (provider) {
              print('Social Login with $provider');
            },
            onForgotPassword: () {
              print('Forgot Password Clicked');
            },
            onSignup: () {
              print('Sign Up Clicked');
            },
          ),
        ],
      );
    }
    return const Text('No preview available for this component.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: FutureBuilder<String>(
        future: _loadDocumentation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MarkdownBody(
                      data: snapshot.data!,
                      styleSheet: MarkdownStyleSheet(
                        h1: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        p: const TextStyle(fontSize: 16),
                        code: const TextStyle(
                          fontFamily: 'monospace',
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Component Previews:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildPreview(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
