import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'lesson_model.dart';
export 'lesson_model.dart';

class LessonWidget extends StatefulWidget {
  const LessonWidget({
    super.key,
    required this.course,
    required this.orders,
  });

  final CoursesRow? course;
  final OrdersRow? orders;

  @override
  State<LessonWidget> createState() => _LessonWidgetState();
}

class _LessonWidgetState extends State<LessonWidget> {
  late LessonModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.lessonList = false;
      setState(() {});
      _model.lessonsQuery = await LessonsTable().queryRows(
        queryFn: (q) => q.eq(
          'course-id',
          widget.course?.id,
        ),
      );
      _model.completedLessonsQuery = await CompletedLessonsTable().queryRows(
        queryFn: (q) => q.eq(
          'order-id',
          widget.orders?.id,
        ),
      );
      _model.lessons = _model.lessonsQuery!.toList().cast<LessonsRow>();
      setState(() {});
      _model.completedLessons =
          _model.completedLessonsQuery!.toList().cast<CompletedLessonsRow>();
      setState(() {});
      await actions.poretrait();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            context.pop();
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 32.0,
          ),
        ),
        title: Align(
          alignment: AlignmentDirectional(1.0, 0.0),
          child: Text(
            valueOrDefault<String>(
              widget.course?.courseTitle,
              'تفاصيل الدرس',
            ),
            textAlign: TextAlign.end,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  letterSpacing: 0.0,
                ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(),
              child: Container(
                width: 974.0,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional(-0.0, 0.0),
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FutureBuilder<List<LessonsRow>>(
                                    future: (_model.requestCompleter ??=
                                            Completer<List<LessonsRow>>()
                                              ..complete(
                                                  LessonsTable().queryRows(
                                                queryFn: (q) => q
                                                    .eq(
                                                      'course-id',
                                                      widget.course?.id,
                                                    )
                                                    .order('lesson-number',
                                                        ascending: true),
                                              )))
                                        .future,
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<LessonsRow> pageViewLessonsRowList =
                                          snapshot.data!;
                                      return Container(
                                        width: double.infinity,
                                        height: 800.0,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 40.0),
                                          child: PageView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            controller: _model
                                                    .pageViewController ??=
                                                PageController(
                                                    initialPage: max(
                                                        0,
                                                        min(
                                                            0,
                                                            pageViewLessonsRowList
                                                                    .length -
                                                                1))),
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                pageViewLessonsRowList.length,
                                            itemBuilder:
                                                (context, pageViewIndex) {
                                              final pageViewLessonsRow =
                                                  pageViewLessonsRowList[
                                                      pageViewIndex];
                                              return SingleChildScrollView(
                                                primary: false,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FutureBuilder<
                                                        List<
                                                            CompletedLessonsRow>>(
                                                      future:
                                                          CompletedLessonsTable()
                                                              .querySingleRow(
                                                        queryFn: (q) => q
                                                            .eq(
                                                              'lesson-id',
                                                              pageViewLessonsRow
                                                                  .id,
                                                            )
                                                            .eq(
                                                              'order-id',
                                                              widget.orders?.id,
                                                            ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<CompletedLessonsRow>
                                                            columnCompletedLessonsRowList =
                                                            snapshot.data!;
                                                        final columnCompletedLessonsRow =
                                                            columnCompletedLessonsRowList
                                                                    .isNotEmpty
                                                                ? columnCompletedLessonsRowList
                                                                    .first
                                                                : null;
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            SingleChildScrollView(
                                                              primary: false,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            15.0,
                                                                            12.0,
                                                                            15.0),
                                                                    child:
                                                                        LinearPercentIndicator(
                                                                      percent:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        functions.percentageOf1(
                                                                            valueOrDefault<int>(
                                                                              _model.completedLessons.length,
                                                                              0,
                                                                            ),
                                                                            valueOrDefault<int>(
                                                                              _model.lessons.length,
                                                                              0,
                                                                            )),
                                                                        0.0,
                                                                      ),
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.9,
                                                                      lineHeight:
                                                                          25.0,
                                                                      animation:
                                                                          true,
                                                                      animateFromLastPercent:
                                                                          true,
                                                                      progressColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                      center:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          functions.percentageOf100(
                                                                              valueOrDefault<int>(
                                                                                _model.completedLessons.length,
                                                                                0,
                                                                              ),
                                                                              valueOrDefault<int>(
                                                                                _model.lessons.length,
                                                                                0,
                                                                              )),
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              fontSize: 20.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      barRadius:
                                                                          Radius.circular(
                                                                              20.0),
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                context.pushNamed(
                                                                                  'video2',
                                                                                  queryParameters: {
                                                                                    'lesson': serializeParam(
                                                                                      pageViewLessonsRow,
                                                                                      ParamType.SupabaseRow,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              child: Stack(
                                                                                alignment: AlignmentDirectional(-0.0, 0.0),
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(4.71, 0.0),
                                                                                    child: Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: FlutterFlowWebView(
                                                                                        content: '<div style=\"position:relative;padding-top:56.25%;\"><iframe src=\"https://iframe.mediadelivery.net/embed/260381/${pageViewLessonsRow.videoid}?autoplay=true&loop=false&muted=false&preload=true&responsive=true\" loading=\"lazy\" style=\"border:0;position:absolute;top:0;height:100%;width:100%;\" allow=\"accelerometer;gyroscope;autoplay;encrypted-media;picture-in-picture;\" allowfullscreen=\"true\"></iframe></div>',
                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        height: 260.0,
                                                                                        verticalScroll: false,
                                                                                        horizontalScroll: false,
                                                                                        html: true,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Opacity(
                                                                                    opacity: 0.6,
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(-0.06, 1.7),
                                                                                      child: Icon(
                                                                                        Icons.play_arrow,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        size: 250.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      context.pushNamed(
                                                                                        'video2',
                                                                                        queryParameters: {
                                                                                          'lesson': serializeParam(
                                                                                            pageViewLessonsRow,
                                                                                            ParamType.SupabaseRow,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                    child: Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                      height: 300.0,
                                                                                      decoration: BoxDecoration(),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              16.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              FlutterFlowIconButton(
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            borderRadius:
                                                                                20.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).accent1,
                                                                            icon:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.bars,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              _model.lessonList = !_model.lessonList;
                                                                              setState(() {});
                                                                            },
                                                                          ),
                                                                        ),
                                                                        if (_model
                                                                            .lessonList)
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              FutureBuilder<List<LessonsRow>>(
                                                                                future: LessonsTable().queryRows(
                                                                                  queryFn: (q) => q
                                                                                      .eq(
                                                                                        'course-id',
                                                                                        widget.course?.id,
                                                                                      )
                                                                                      .order('lesson-number', ascending: true),
                                                                                ),
                                                                                builder: (context, snapshot) {
                                                                                  // Customize what your widget looks like when it's loading.
                                                                                  if (!snapshot.hasData) {
                                                                                    return Center(
                                                                                      child: SizedBox(
                                                                                        width: 50.0,
                                                                                        height: 50.0,
                                                                                        child: CircularProgressIndicator(
                                                                                          valueColor: AlwaysStoppedAnimation<Color>(
                                                                                            FlutterFlowTheme.of(context).primary,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  List<LessonsRow> listViewLessonsRowList = snapshot.data!;
                                                                                  return ListView.builder(
                                                                                    padding: EdgeInsets.zero,
                                                                                    primary: false,
                                                                                    shrinkWrap: true,
                                                                                    scrollDirection: Axis.vertical,
                                                                                    itemCount: listViewLessonsRowList.length,
                                                                                    itemBuilder: (context, listViewIndex) {
                                                                                      final listViewLessonsRow = listViewLessonsRowList[listViewIndex];
                                                                                      return InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          await _model.pageViewController?.animateToPage(
                                                                                            listViewIndex,
                                                                                            duration: Duration(milliseconds: 500),
                                                                                            curve: Curves.ease,
                                                                                          );

                                                                                          setState(() {});
                                                                                          _model.lessonList = false;
                                                                                          setState(() {});
                                                                                        },
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 16.0, 12.0),
                                                                                              child: FutureBuilder<List<CompletedLessonsRow>>(
                                                                                                future: CompletedLessonsTable().querySingleRow(
                                                                                                  queryFn: (q) => q
                                                                                                      .eq(
                                                                                                        'lesson-id',
                                                                                                        listViewLessonsRow.id,
                                                                                                      )
                                                                                                      .eq(
                                                                                                        'order-id',
                                                                                                        widget.orders?.id,
                                                                                                      ),
                                                                                                ),
                                                                                                builder: (context, snapshot) {
                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                  if (!snapshot.hasData) {
                                                                                                    return Center(
                                                                                                      child: SizedBox(
                                                                                                        width: 50.0,
                                                                                                        height: 50.0,
                                                                                                        child: CircularProgressIndicator(
                                                                                                          valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                            FlutterFlowTheme.of(context).primary,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                  List<CompletedLessonsRow> rowCompletedLessonsRowList = snapshot.data!;
                                                                                                  final rowCompletedLessonsRow = rowCompletedLessonsRowList.isNotEmpty ? rowCompletedLessonsRowList.first : null;
                                                                                                  return Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                        child: Container(
                                                                                                          width: 30.0,
                                                                                                          height: 30.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            borderRadius: BorderRadius.circular(24.0),
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              width: 2.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Visibility(
                                                                                                            visible: listViewIndex == _model.pageViewCurrentIndex,
                                                                                                            child: Icon(
                                                                                                              Icons.check_rounded,
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              size: 24.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                        child: Container(
                                                                                                          width: 44.0,
                                                                                                          height: 44.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                            shape: BoxShape.circle,
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            functions.addOne(listViewIndex).toString(),
                                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                  fontFamily: 'Readex Pro',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Expanded(
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                            child: Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                listViewLessonsRow.name,
                                                                                                                'lesson',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      if (listViewLessonsRow.id == rowCompletedLessonsRow?.lessonId)
                                                                                                        Icon(
                                                                                                          Icons.check_circle_sharp,
                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                      Icon(
                                                                                                        Icons.chevron_right_rounded,
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        size: 24.0,
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              100.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Divider(
                                                                                thickness: 1.0,
                                                                                color: FlutterFlowTheme.of(context).accent4,
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    pageViewLessonsRow.name,
                                                                                    'lesson',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                child: Text(
                                                                                  pageViewLessonsRow.description!,
                                                                                  textAlign: TextAlign.end,
                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              if (pageViewLessonsRow.id == columnCompletedLessonsRow?.lessonId)
                                                                                Text(
                                                                                  'المحاضرة مكتملة مسبقا',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 24.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onDoubleTap: () async {
                                                                                      setState(() {});
                                                                                    },
                                                                                    onLongPress: () async {
                                                                                      setState(() {});
                                                                                    },
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        await _model.pageViewController?.nextPage(
                                                                                          duration: Duration(milliseconds: 300),
                                                                                          curve: Curves.ease,
                                                                                        );
                                                                                        _model.lessonList = false;
                                                                                        setState(() {});
                                                                                        if (pageViewLessonsRow.id == columnCompletedLessonsRow?.lessonId) {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                'لقد اكملت هذه المحاضرة مسبقا',
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                            ),
                                                                                          );
                                                                                        } else {
                                                                                          _model.completedLessonsRow = await CompletedLessonsTable().insert({
                                                                                            'checked': true,
                                                                                            'lesson-id': pageViewLessonsRow.id,
                                                                                            'order-id': widget.orders?.id,
                                                                                          });
                                                                                          setState(() => _model.requestCompleter = null);
                                                                                          _model.addToCompletedLessons(_model.completedLessonsRow!);
                                                                                          setState(() {});
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                'لقد تم  اكمال  المحاضرة',
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                            ),
                                                                                          );
                                                                                        }

                                                                                        if (_model.lessons.length == _model.completedLessons.length) {
                                                                                          await OrdersTable().update(
                                                                                            data: {
                                                                                              'course-competed': true,
                                                                                            },
                                                                                            matchingRows: (rows) => rows.eq(
                                                                                              'id',
                                                                                              widget.orders?.id,
                                                                                            ),
                                                                                          );

                                                                                          context.goNamed('orders');

                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                'مبروك لقد تم  اكمال  الدرس',
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                            ),
                                                                                          );
                                                                                        }

                                                                                        setState(() {});
                                                                                      },
                                                                                      text: pageViewLessonsRow.id == columnCompletedLessonsRow?.lessonId ? 'انتقل الى التالي' : 'أكملت المحاضرة  انتقل الى التالي',
                                                                                      options: FFButtonOptions(
                                                                                        width: 353.0,
                                                                                        height: 60.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        textStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Colors.white,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        elevation: 3.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(40.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (pageViewLessonsRow.id == columnCompletedLessonsRow?.lessonId)
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return WebViewAware(
                                                                                              child: AlertDialog(
                                                                                                content: Text('هل تريد اعادة الدرس من البداية؟'),
                                                                                                actions: [
                                                                                                  TextButton(
                                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                    child: Text('ألغاء'),
                                                                                                  ),
                                                                                                  TextButton(
                                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                    child: Text('حسنا'),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ) ??
                                                                                        false;
                                                                                    if (confirmDialogResponse) {
                                                                                      _model.delcmpletedLesson = await CompletedLessonsTable().delete(
                                                                                        matchingRows: (rows) => rows
                                                                                            .eq(
                                                                                              'lesson-id',
                                                                                              pageViewLessonsRow.id,
                                                                                            )
                                                                                            .eq(
                                                                                              'order-id',
                                                                                              widget.orders?.id,
                                                                                            ),
                                                                                        returnRows: true,
                                                                                      );
                                                                                      _model.removeFromCompletedLessons(_model.delcmpletedLesson!.first);
                                                                                      setState(() {});
                                                                                    }

                                                                                    setState(() {});
                                                                                  },
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.restore_from_trash,
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      Text(
                                                                                        'أعادة هذه المحاضرة؟',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
