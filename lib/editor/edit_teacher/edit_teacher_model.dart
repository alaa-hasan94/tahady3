import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'edit_teacher_widget.dart' show EditTeacherWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditTeacherModel extends FlutterFlowModel<EditTeacherWidget> {
  ///  Local state fields for this page.

  bool onwhatsapp = true;

  bool ontelegram = true;

  bool onfacebook = true;

  bool oninstagram = true;

  bool onviber = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<TeachersRow>? teachers;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for productName widget.
  FocusNode? productNameFocusNode1;
  TextEditingController? productNameTextController1;
  String? Function(BuildContext, String?)? productNameTextController1Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for productName widget.
  FocusNode? productNameFocusNode2;
  TextEditingController? productNameTextController2;
  String? Function(BuildContext, String?)? productNameTextController2Validator;
  // State field(s) for productName widget.
  FocusNode? productNameFocusNode3;
  TextEditingController? productNameTextController3;
  String? Function(BuildContext, String?)? productNameTextController3Validator;
  // State field(s) for productName widget.
  FocusNode? productNameFocusNode4;
  TextEditingController? productNameTextController4;
  String? Function(BuildContext, String?)? productNameTextController4Validator;
  // State field(s) for productName widget.
  FocusNode? productNameFocusNode5;
  TextEditingController? productNameTextController5;
  String? Function(BuildContext, String?)? productNameTextController5Validator;
  // State field(s) for productName widget.
  FocusNode? productNameFocusNode6;
  TextEditingController? productNameTextController6;
  String? Function(BuildContext, String?)? productNameTextController6Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    productNameFocusNode1?.dispose();
    productNameTextController1?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    productNameFocusNode2?.dispose();
    productNameTextController2?.dispose();

    productNameFocusNode3?.dispose();
    productNameTextController3?.dispose();

    productNameFocusNode4?.dispose();
    productNameTextController4?.dispose();

    productNameFocusNode5?.dispose();
    productNameTextController5?.dispose();

    productNameFocusNode6?.dispose();
    productNameTextController6?.dispose();
  }
}
