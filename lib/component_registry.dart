import 'package:flutter/material.dart';
import 'package:wtflutter/wtflutter.dart';

// Map of component names to their respective pages
final Map<String, Widget Function()> componentRegistry = {
  'login_form': () => const LoginFormPage(),
  'signup_form': () => const SignupFormPage(),
  // Add other components here...
};
