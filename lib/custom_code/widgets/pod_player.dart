// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';
import 'package:pod_player/pod_player.dart';

class PodPlayer extends StatefulWidget {
  const PodPlayer({
    super.key,
    this.width,
    this.height,
    required this.url,
    required this.action,
    required this.overlay,
  });

  final double? width;
  final double? height;
  final String url;
  final Future Function() action;
  final Future Function() overlay;

  @override
  State<PodPlayer> createState() => _PodPlayerState();
}

class _PodPlayerState extends State<PodPlayer> {
  late final PodPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(widget.url),
      podPlayerConfig: const PodPlayerConfig(
        autoPlay: true,
        isLooping: true,
        videoQualityPriority: [720, 360], // Added 480p to the list
      ),
    )..initialise();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _lockOrientation() {
    final Orientation currentOrientation = MediaQuery.of(context).orientation;
    if (currentOrientation == Orientation.portrait) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }

  Future<void> _overlayTap() async {
    await widget.overlay();
  }

  Future<void> _handleTap() async {
    _lockOrientation();
    await widget.action();
  }

  @override
  Widget build(BuildContext context) {
    final double containerWidth =
        MediaQuery.of(context).size.width > MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.height * 1.78
            : MediaQuery.of(context).size.width;
    final double containerHeight =
        MediaQuery.of(context).size.height > MediaQuery.of(context).size.width
            ? MediaQuery.of(context).size.width * 0.57
            : MediaQuery.of(context).size.height;

    return InteractiveViewer(
      scaleEnabled: true,
      maxScale: 4,
      minScale: 0.5,
      child: Center(
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Container(
            width: containerWidth,
            height: containerHeight,
            color: Colors.black,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: _overlayTap,
                  child: PodVideoPlayer(controller: controller),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1.0, bottom: 6.0),
                    child: GestureDetector(
                      onTap: _handleTap,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          shape: BoxShape.rectangle,
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.fullscreen,
                          color: Colors.white,
                          size: 32.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
