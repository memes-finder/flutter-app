// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

import 'package:better_player/better_player.dart';

class BetterPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final double width;
  final double height;

  const BetterPlayerWidget({
    Key? key,
    required this.videoUrl,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _BetterPlayerWidgetState createState() => _BetterPlayerWidgetState();
}

class _BetterPlayerWidgetState extends State<BetterPlayerWidget> {
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    super.initState();
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.videoUrl,
    );
    _betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
        aspectRatio: 9 / 16,
        fit: BoxFit.contain,
        autoPlay: true,
        looping: true,
        controlsConfiguration: BetterPlayerControlsConfiguration(
          showControls: false, // Hide controls for clean look
          enableFullscreen: false,
        ),
      ),
      betterPlayerDataSource: dataSource,
    );
  }

  void _togglePlayPause() {
    if (_betterPlayerController.isPlaying()!) {
      _betterPlayerController.pause();
    } else {
      _betterPlayerController.play();
    }
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlayPause, // Detect tap to toggle play/pause
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: BetterPlayer(
          controller: _betterPlayerController,
        ),
      ),
    );
  }
}
