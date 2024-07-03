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

import 'package:twilio_flutter/twilio_flutter.dart';

Future twiliowhats(
  String phoneUser,
  String messageSMS,
) async {
  var twilioFlutter = TwilioFlutter(
      accountSid: 'ACfb313261f0e415bd5ed24aa1c34c0dd3',
      authToken: 'd8a47741db102097814186d0ae45b78a',
      twilioNumber: '9647830925358',
      messagingServiceSid: 'VA23e2d7aec7b369a0d7f793dff948c874');

  await twilioFlutter.sendWhatsApp(
      toNumber: phoneUser, messageBody: messageSMS);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
