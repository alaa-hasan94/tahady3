import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'editlesson_widget.dart' show EditlessonWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditlessonModel extends FlutterFlowModel<EditlessonWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for lessonName widget.
  FocusNode? lessonNameFocusNode;
  TextEditingController? lessonNameTextController;
  String? Function(BuildContext, String?)? lessonNameTextControllerValidator;
  // State field(s) for lessonNumber widget.
  FocusNode? lessonNumberFocusNode;
  TextEditingController? lessonNumberTextController;
  String? Function(BuildContext, String?)? lessonNumberTextControllerValidator;
  // State field(s) for youtube widget.
  FocusNode? youtubeFocusNode;
  TextEditingController? youtubeTextController;
  String? Function(BuildContext, String?)? youtubeTextControllerValidator;
  // State field(s) for html widget.
  FocusNode? htmlFocusNode;
  TextEditingController? htmlTextController;
  String? Function(BuildContext, String?)? htmlTextControllerValidator;
  // State field(s) for lessonDesc widget.
  FocusNode? lessonDescFocusNode;
  TextEditingController? lessonDescTextController;
  String? Function(BuildContext, String?)? lessonDescTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    lessonNameFocusNode?.dispose();
    lessonNameTextController?.dispose();

    lessonNumberFocusNode?.dispose();
    lessonNumberTextController?.dispose();

    youtubeFocusNode?.dispose();
    youtubeTextController?.dispose();

    htmlFocusNode?.dispose();
    htmlTextController?.dispose();

    lessonDescFocusNode?.dispose();
    lessonDescTextController?.dispose();
  }
}
