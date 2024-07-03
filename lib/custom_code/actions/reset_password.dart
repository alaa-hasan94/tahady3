// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

final supabase = SupaFlow.client;

Future<String?> resetPassword(String password) async {
  // Add your function code here!
  try {
    final UserResponse res = await supabase.auth.updateUser(
      UserAttributes(
        password: password,
      ),
    );
    final User? updatedUser = res.user;
    return ' $res';
  } catch (error) {
    print(' $error');
    return ' $error'; // Return error message if signup fails
  }
}
