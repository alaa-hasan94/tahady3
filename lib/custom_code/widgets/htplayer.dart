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

import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class Htplayer extends StatefulWidget {
  const Htplayer({
    super.key,
    this.width,
    this.height,
    required this.id,
  });

  final double? width;
  final double? height;
  final String id;

  @override
  State<Htplayer> createState() => _HtplayerState();
}

class _HtplayerState extends State<Htplayer> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // Create platform-specific WebView controller parameters
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    // Initialize WebView controller with platform-specific parameters
    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    // Additional configuration for Android
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    _controller = controller;
    _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    _controller.setBackgroundColor(const Color(0x00000000));
    _controller.loadHtmlString('''
        <div style="background:#000000; padding: 0; margin: 0;" >
          <iframe src="https://iframe.mediadelivery.net/embed/260381/${widget.id}?autoplay=true&loop=false&muted=false&preload=true&responsive=true" 
                  loading="lazy" 
                  style="border:0;position:absolute;top:0;height:100%;width:100%;background:#000000" 
                  allow="accelerometer;gyroscope;autoplay;encrypted-media;picture-in-picture;" 
                  playsinline="true"
                  webkit-playsinline="true"
                  disableIosPlayer="true"
                  >
          </iframe>
        </div>
      ''');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: widget.width,
      height: widget.height,
      child: InteractiveViewer(
        scaleEnabled: true,
        maxScale: 4,
        minScale: 0.5,
        child: Center(
          child: WebViewWidget(
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
