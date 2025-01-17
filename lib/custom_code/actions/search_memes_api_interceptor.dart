// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/backend/api_requests/api_interceptor.dart';

class SearchMemesApiInterceptor extends FFApiInterceptor {
  @override
  Future<ApiCallOptions> onRequest({
    required ApiCallOptions options,
  }) async {
    // Check if query parameters (params) contain the list of strings.
    if (options.params.containsKey('tags') &&
        options.params['tags'] is String) {
      // Extract the list of strings
      final tagsString = options.params['tags'] as String;

      final tagsList = tagsString
          .replaceAll('[', '') // Remove opening bracket
          .replaceAll(']', '') // Remove closing bracket
          .split(',') // Split by commas
          .map((tag) => tag.trim()) // Trim whitespace around each tag
          .toList();

      // Convert the list of strings into a comma-separated string
      final tagsCSV = tagsList.join(',');

      // Update the params with the converted string
      options.params['tags'] = tagsCSV;
    }

    // Return the modified options
    return options;
  }

  @override
  Future<ApiCallResponse> onResponse({
    required ApiCallResponse response,
    required Future<ApiCallResponse> Function() retryFn,
  }) async {
    // Perform any necessary calls or modifications to the response if needed.
    return response;
  }
}
