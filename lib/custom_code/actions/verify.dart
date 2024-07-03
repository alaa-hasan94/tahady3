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
Future<dynamic> verify(
  String phone,
  String token,
) async {
  try {
    final AuthResponse res = await supabase.auth.verifyOTP(
      type: OtpType.sms,
      token: token,
      phone: phone,
    );
    final Session? session = res.session;
    final User? user = res.user;
    return res; // Return AuthResponse if signup is successful
  } catch (error) {
    print(' $error');
    return ': $error'; // Return error message if signup fails
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
