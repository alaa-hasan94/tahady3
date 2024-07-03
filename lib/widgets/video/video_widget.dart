import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_model.dart';
export 'video_model.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({
    super.key,
    String? videoid,
  }) : this.videoid = videoid ?? 'id';

  final String videoid;

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget>
    with TickerProviderStateMixin {
  late VideoModel _model;

  var hasTextTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.blockScreenRecordingAndScreenshots();
      await actions.hideStatusBar();
      _model.showicon = true;
      setState(() {});
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProfilesRow>>(
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
        return InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            _model.showicon = true;
            setState(() {});
            await Future.delayed(const Duration(milliseconds: 3000));
            _model.showicon = false;
            setState(() {});
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                alignment: AlignmentDirectional(-0.0, 0.0),
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(),
                      alignment: AlignmentDirectional(0.0, 0.0),
                    ),
                  ),
                  if (_model.showicon)
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
                      alignment: AlignmentDirectional(-0.3, -0.06),
                      child: Text(
                        valueOrDefault<String>(
                          containerProfilesRow?.phoneNumber,
                          '0',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFFBDBDBD),
                              fontSize: 28.0,
                              letterSpacing: 0.0,
                            ),
                      ).animateOnActionTrigger(
                          animationsMap['textOnActionTriggerAnimation']!,
                          hasBeenTriggered: hasTextTriggered),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 270.0,
                    child: custom_widgets.Htplayer(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 270.0,
                      id: widget.videoid,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
