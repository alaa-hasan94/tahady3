import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // Stores action output result for [Custom Action - resetPassword] action in Button widget.
  String? changepass;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    phoneFocusNode?.dispose();
    phoneTextController?.dispose();
  }
}
