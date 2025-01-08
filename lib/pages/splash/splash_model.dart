import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'splash_widget.dart' show SplashWidget;
import 'package:flutter/material.dart';

class SplashModel extends FlutterFlowModel<SplashWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Trending Tags)] action in Splash widget.
  ApiCallResponse? apiResultTrendingTags;
  // Stores action output result for [Backend Call - API (Home Memes Images)] action in Splash widget.
  ApiCallResponse? apiResultHomeMemesImages;
  // Stores action output result for [Backend Call - API (Home Memes Videos)] action in Splash widget.
  ApiCallResponse? apiResultHomeMemesVideos;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
