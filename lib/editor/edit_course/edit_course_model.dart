import '/backend/supabase/supabase.dart';
import '/editor/editlesson/editlesson_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/widgets/video/video_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_course_widget.dart' show EditCourseWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditCourseModel extends FlutterFlowModel<EditCourseWidget> {
  ///  Local state fields for this page.

  String videoId = 'id';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
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
  // State field(s) for productName widget.
  FocusNode? productNameFocusNode2;
  TextEditingController? productNameTextController2;
  String? Function(BuildContext, String?)? productNameTextController2Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for DropDownTeacher widget.
  String? dropDownTeacherValue;
  FormFieldController<String>? dropDownTeacherValueController;
  // State field(s) for DropDowngat widget.
  String? dropDowngatValue;
  FormFieldController<String>? dropDowngatValueController;
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
    unfocusNode.dispose();
    productNameFocusNode1?.dispose();
    productNameTextController1?.dispose();

    productNameFocusNode2?.dispose();
    productNameTextController2?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

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
