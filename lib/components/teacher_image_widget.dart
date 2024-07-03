import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'teacher_image_model.dart';
export 'teacher_image_model.dart';

class TeacherImageWidget extends StatefulWidget {
  const TeacherImageWidget({
    super.key,
    this.parameter1,
  });

  final String? parameter1;

  @override
  State<TeacherImageWidget> createState() => _TeacherImageWidgetState();
}

class _TeacherImageWidgetState extends State<TeacherImageWidget> {
  late TeacherImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeacherImageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 91.0,
      height: 91.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).accent1,
        shape: BoxShape.circle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).primary,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Container(
          width: 70.0,
          height: 70.0,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.network(
            widget.parameter1!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
