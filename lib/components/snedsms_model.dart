import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'snedsms_widget.dart' show SnedsmsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SnedsmsModel extends FlutterFlowModel<SnedsmsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    phoneFocusNode?.dispose();
    phoneTextController?.dispose();
  }
}
