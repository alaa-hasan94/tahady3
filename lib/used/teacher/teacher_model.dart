import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/teacher_image_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'teacher_widget.dart' show TeacherWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeacherModel extends FlutterFlowModel<TeacherWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for teacherImage component.
  late TeacherImageModel teacherImageModel;

  @override
  void initState(BuildContext context) {
    teacherImageModel = createModel(context, () => TeacherImageModel());
  }

  @override
  void dispose() {
    teacherImageModel.dispose();
  }
}
