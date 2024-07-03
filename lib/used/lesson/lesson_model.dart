import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'lesson_widget.dart' show LessonWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LessonModel extends FlutterFlowModel<LessonWidget> {
  ///  Local state fields for this page.

  bool lessonList = true;

  List<LessonsRow> lessons = [];
  void addToLessons(LessonsRow item) => lessons.add(item);
  void removeFromLessons(LessonsRow item) => lessons.remove(item);
  void removeAtIndexFromLessons(int index) => lessons.removeAt(index);
  void insertAtIndexInLessons(int index, LessonsRow item) =>
      lessons.insert(index, item);
  void updateLessonsAtIndex(int index, Function(LessonsRow) updateFn) =>
      lessons[index] = updateFn(lessons[index]);

  List<CompletedLessonsRow> completedLessons = [];
  void addToCompletedLessons(CompletedLessonsRow item) =>
      completedLessons.add(item);
  void removeFromCompletedLessons(CompletedLessonsRow item) =>
      completedLessons.remove(item);
  void removeAtIndexFromCompletedLessons(int index) =>
      completedLessons.removeAt(index);
  void insertAtIndexInCompletedLessons(int index, CompletedLessonsRow item) =>
      completedLessons.insert(index, item);
  void updateCompletedLessonsAtIndex(
          int index, Function(CompletedLessonsRow) updateFn) =>
      completedLessons[index] = updateFn(completedLessons[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in lesson widget.
  List<LessonsRow>? lessonsQuery;
  // Stores action output result for [Backend Call - Query Rows] action in lesson widget.
  List<CompletedLessonsRow>? completedLessonsQuery;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - Insert Row] action in ButtonPrimary widget.
  CompletedLessonsRow? completedLessonsRow;
  Completer<List<LessonsRow>>? requestCompleter;
  // Stores action output result for [Backend Call - Delete Row(s)] action in Row widget.
  List<CompletedLessonsRow>? delcmpletedLesson;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
