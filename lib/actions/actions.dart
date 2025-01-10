import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';

Future getHomeContent(BuildContext context) async {
  ApiCallResponse? apiResultTrendingTags;
  ApiCallResponse? apiResultHomeMemesImages;
  ApiCallResponse? apiResultHomeMemesVideos;

  await Future.wait([
    Future(() async {
      apiResultTrendingTags = await TrendingTagsCall.call();

      FFAppState().trendingTagsAppState = TrendingTagsCall.trendingTagsList(
        (apiResultTrendingTags?.jsonBody ?? ''),
      )!
          .toList()
          .cast<TrendingTagsItemStruct>();
    }),
    Future(() async {
      apiResultHomeMemesImages = await HomeMemesImagesCall.call(
        q: 'ميم',
        page: 1,
      );

      FFAppState().homeImagesAppState = (getJsonField(
        (apiResultHomeMemesImages?.jsonBody ?? ''),
        r'''$.data.items''',
        true,
      )!
              .toList()
              .map<HomeMemesImageStruct?>(HomeMemesImageStruct.maybeFromMap)
              .toList() as Iterable<HomeMemesImageStruct?>)
          .withoutNulls
          .toList()
          .cast<HomeMemesImageStruct>();
    }),
    Future(() async {
      apiResultHomeMemesVideos = await HomeMemesVideosCall.call(
        q: 'ميم',
        page: 1,
      );

      FFAppState().homeVideosAppState = (getJsonField(
        (apiResultHomeMemesVideos?.jsonBody ?? ''),
        r'''$.data.items''',
        true,
      )!
              .toList()
              .map<HomeMemeVideoStruct?>(HomeMemeVideoStruct.maybeFromMap)
              .toList() as Iterable<HomeMemeVideoStruct?>)
          .withoutNulls
          .toList()
          .cast<HomeMemeVideoStruct>();
    }),
  ]);
}

Future searchMemes(
  BuildContext context, {
  String? searchQuery,
  int? page,
  String? tags,
  String? type,
}) async {
  ApiCallResponse? apiResulta6p;
  ApiCallResponse? apiResulttep;

  await Future.wait([
    Future(() async {
      apiResulta6p = await HomeMemesImagesCall.call(
        q: searchQuery,
        page: page,
        tags: tags,
      );

      FFAppState().searchImagesAppState = (getJsonField(
        (apiResulta6p?.jsonBody ?? ''),
        r'''$.data.items''',
        true,
      )!
              .toList()
              .map<HomeMemesImageStruct?>(HomeMemesImageStruct.maybeFromMap)
              .toList() as Iterable<HomeMemesImageStruct?>)
          .withoutNulls
          .toList()
          .cast<HomeMemesImageStruct>();
    }),
    Future(() async {
      apiResulttep = await HomeMemesVideosCall.call(
        q: searchQuery,
        page: page,
        tags: tags,
      );

      FFAppState().searchVideosAppState = (getJsonField(
        (apiResulttep?.jsonBody ?? ''),
        r'''$.data.items''',
        true,
      )!
              .toList()
              .map<HomeMemeVideoStruct?>(HomeMemeVideoStruct.maybeFromMap)
              .toList() as Iterable<HomeMemeVideoStruct?>)
          .withoutNulls
          .toList()
          .cast<HomeMemeVideoStruct>();
    }),
  ]);
}

Future increaseMemeView(
  BuildContext context, {
  required String? id,
}) async {
  unawaited(
    () async {
      await IncMemeViewCall.call(
        id: id,
      );
    }(),
  );
}
