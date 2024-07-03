import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

int addOne(int value) {
  return value + 1;
}

double percentageOf1(
  int num,
  int baseNum,
) {
  return num / baseNum;
}

String? percentageOf100(
  int num,
  int numBase,
) {
  int result = ((num / numBase) * 100).toInt();
  return '$result%';
}

String? phoneNumber(String? number) {
  if (number != null && number.startsWith('0')) {
    number = number.substring(1);
  }

  return number != null ? "+964$number" : null;
}

double? minus(
  double first,
  double second,
) {
  return first - second;
}

double incrementMoney(
  double money,
  double value,
) {
  // increment money of the value
  return money + value;
}

String? add964(String? number) {
  if (number != null && number.startsWith('0')) {
    number = number.substring(1);
  }

  return number != null ? "964$number" : null;
}

double height(double scwidth) {
  return scwidth * 0.57;
}
