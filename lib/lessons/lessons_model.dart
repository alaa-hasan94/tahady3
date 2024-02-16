import '/components/lessons_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lessons_widget.dart' show LessonsWidget;
import 'package:flutter/material.dart';

class LessonsModel extends FlutterFlowModel<LessonsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for lessonsComponent component.
  late LessonsComponentModel lessonsComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    lessonsComponentModel = createModel(context, () => LessonsComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    lessonsComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
