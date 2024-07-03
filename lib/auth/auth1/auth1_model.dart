import '/auth/whatsapp/whatsapp_widget.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'auth1_widget.dart' show Auth1Widget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class Auth1Model extends FlutterFlowModel<Auth1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for phonein widget.
  FocusNode? phoneinFocusNode;
  TextEditingController? phoneinTextController;
  String? Function(BuildContext, String?)? phoneinTextControllerValidator;
  // State field(s) for passwordin widget.
  FocusNode? passwordinFocusNode;
  TextEditingController? passwordinTextController;
  late bool passwordinVisibility;
  String? Function(BuildContext, String?)? passwordinTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ProfilesRow>? rofilesin;
  // Stores action output result for [Custom Action - signin] action in Button widget.
  dynamic? signin;
  // State field(s) for phoneup widget.
  FocusNode? phoneupFocusNode;
  TextEditingController? phoneupTextController;
  String? Function(BuildContext, String?)? phoneupTextControllerValidator;
  String? _phoneupTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'يجب ملء الحقل';
    }

    if (val.length < 10) {
      return 'رقم الهاتف قصير';
    }
    if (val.length > 11) {
      return 'رقم الهاتف لا يمكن ان يكون اكثر من 11';
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ProfilesRow>? rofilesup;

  @override
  void initState(BuildContext context) {
    passwordinVisibility = false;
    phoneupTextControllerValidator = _phoneupTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    phoneinFocusNode?.dispose();
    phoneinTextController?.dispose();

    passwordinFocusNode?.dispose();
    passwordinTextController?.dispose();

    phoneupFocusNode?.dispose();
    phoneupTextController?.dispose();
  }
}
