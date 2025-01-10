import 'dart:convert';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class TrendingTagsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Trending Tags',
      apiUrl: 'https://memesplanet.com/api/tags/trending',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'lang': "ar",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<TrendingTagsItemStruct>? trendingTagsList(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data.trending_tags''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => TrendingTagsItemStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class HomeMemesImagesCall {
  static Future<ApiCallResponse> call({
    String? q,
    int? page = 1,
    String? tags,
  }) async {
    q ??= '';
    tags ??= '';

    return ApiManager.instance.makeApiCall(
      callName: 'Home Memes Images',
      apiUrl: 'https://memesplanet.com/api/search',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'q': q,
        'page': page,
        'tags': tags,
        'type': "image",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static HomeMemesImageStruct? homeMemesImages(dynamic response) =>
      HomeMemesImageStruct.maybeFromMap(getJsonField(
        response,
        r'''$.data.items''',
      ));
}

class HomeMemesVideosCall {
  static Future<ApiCallResponse> call({
    String? q,
    int? page = 1,
    String? tags,
  }) async {
    q ??= '';
    tags ??= '';

    return ApiManager.instance.makeApiCall(
      callName: 'Home Memes Videos',
      apiUrl: 'https://memesplanet.com/api/search',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'q': q,
        'type': "video",
        'tags': tags,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static HomeMemeVideoStruct? homeMemesVideos(dynamic response) =>
      HomeMemeVideoStruct.maybeFromMap(getJsonField(
        response,
        r'''$.data.items''',
      ));
}

class SearchMemesCall {
  static Future<ApiCallResponse> call({
    String? q = 'ميم',
    int? page = 1,
    String? tags = '',
    String? type = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Search Memes',
      apiUrl: 'https://memesplanet.com/api/search',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'q': q,
        'page': page,
        'type': type,
        'tags': tags,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static MemesSearchStruct? apiSearchResult(dynamic response) =>
      MemesSearchStruct.maybeFromMap(getJsonField(
        response,
        r'''$.data.items''',
      ));
}

class MemePostLaughCall {
  static Future<ApiCallResponse> call({
    String? id = '0',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Meme Post Laugh',
      apiUrl: 'https://memesplanet.com/api/memes/laugh/$id',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class IncMemeViewCall {
  static Future<ApiCallResponse> call({
    String? id = '0',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Inc Meme View',
      apiUrl: 'https://memesplanet.com/api/memes/view/$id',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
