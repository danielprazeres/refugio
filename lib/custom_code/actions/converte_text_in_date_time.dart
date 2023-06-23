// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
Future<DateTime> converteTextInDateTime(String? dtNasc) async {
  // Create a code to convert Text in DateTime
  if (dtNasc == null) {
    return DateTime.now();
  }

  try {
    final dt = DateFormat('dd/MM/yyyy').parse(dtNasc);
    return dt;
  } catch (e) {
    throw Exception('Invalid date format');
  }
}
