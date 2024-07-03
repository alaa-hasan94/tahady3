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
Future<String?> singinwhatsapp(String phone) async {
  // Add your function code here!
  try {
    await supabase.auth.signInWithOtp(
      phone: phone,
      shouldCreateUser: false,
      channel: OtpChannel.whatsapp,
    );
    return 'تم ارسال الرمز';
  } catch (error) {
    print(' $error');
    return '$error'; // Return error message if signup fails
  }
}
