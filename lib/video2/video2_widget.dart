import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video2_model.dart';
export 'video2_model.dart';

class Video2Widget extends StatefulWidget {
  const Video2Widget({
    super.key,
    required this.lesson,
  });

  final LessonsRow? lesson;

  @override
  State<Video2Widget> createState() => _Video2WidgetState();
}

class _Video2WidgetState extends State<Video2Widget>
    with TickerProviderStateMixin {
  late Video2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasTextTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Video2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.landscape();
      await actions.hideStatusBar();
    });

    animationsMap.addAll({
      'textOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: Offset(100.0, -35.0),
            end: Offset(-12.0, 12.000000000000014),
          ),
          MoveEffect(
            curve: Curves.linear,
            delay: 2000.0.ms,
            duration: 2000.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(100.0, 35.0),
          ),
          MoveEffect(
            curve: Curves.linear,
            delay: 1920.0.ms,
            duration: 2000.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(100.0, 100.0),
          ),
          BlurEffect(
            curve: Curves.easeIn,
            delay: 9920.0.ms,
            duration: 2000.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(4.0, 4.0),
          ),
          BlurEffect(
            curve: Curves.easeIn,
            delay: 9920.0.ms,
            duration: 2000.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(4.0, 4.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: Offset(100.0, -35.0),
            end: Offset(-12.0, 12.000000000000014),
          ),
          MoveEffect(
            curve: Curves.linear,
            delay: 2000.0.ms,
            duration: 2000.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(100.0, 35.0),
          ),
          MoveEffect(
            curve: Curves.linear,
            delay: 1920.0.ms,
            duration: 2000.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(100.0, 100.0),
          ),
          BlurEffect(
            curve: Curves.easeIn,
            delay: 9920.0.ms,
            duration: 2000.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(4.0, 4.0),
          ),
          BlurEffect(
            curve: Curves.easeIn,
            delay: 9920.0.ms,
            duration: 2000.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(4.0, 4.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        body: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: FutureBuilder<List<ProfilesRow>>(
            future: ProfilesTable().querySingleRow(
              queryFn: (q) => q.eq(
                'use-id',
                currentUserUid,
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
              List<ProfilesRow> containerProfilesRowList = snapshot.data!;
              final containerProfilesRow = containerProfilesRowList.isNotEmpty
                  ? containerProfilesRowList.first
                  : null;
              return Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: Stack(
                    alignment: AlignmentDirectional(-0.0, 0.0),
                    children: [
                      FlutterFlowWebView(
                        content:
                            '<div style=\"background:#000000; padding: 0; margin: 0;\" >           <iframe src=\"https://iframe.mediadelivery.net/embed/260381/${widget.lesson?.videoid}?autoplay=true&loop=false&muted=false&preload=true&responsive=true\"                    loading=\"lazy\"                    style=\"border:0;position:absolute;top:0;height:100%;width:100%;background:#000000\"                    allow=\"accelerometer;gyroscope;autoplay;encrypted-media;picture-in-picture;\"                    playsinline=\"true\"                   webkit-playsinline=\"true\"disableIosPlayer=\"true\"></iframe></div>',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 500.0,
                        verticalScroll: false,
                        horizontalScroll: false,
                        html: true,
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.99, -0.95),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await actions.poretrait();
                              await actions.showstatusbar();
                              context.safePop();
                            },
                            child: FaIcon(
                              FontAwesomeIcons.windowClose,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 45.0,
                            ),
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.3,
                        child: Align(
                          alignment: AlignmentDirectional(0.52, 0.16),
                          child: Text(
                            valueOrDefault<String>(
                              containerProfilesRow?.phoneNumber,
                              '07712345678',
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFFBDBDBD),
                                  fontSize: 28.0,
                                  letterSpacing: 0.0,
                                ),
                          )
                              .animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation']!)
                              .animateOnActionTrigger(
                                  animationsMap[
                                      'textOnActionTriggerAnimation']!,
                                  hasBeenTriggered: hasTextTriggered),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
