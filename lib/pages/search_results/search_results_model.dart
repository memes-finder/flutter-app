import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'search_results_widget.dart' show SearchResultsWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchResultsModel extends FlutterFlowModel<SearchResultsWidget> {
  ///  Local state fields for this page.

  List<HomeMemesImageStruct> searchResultsImages = [];
  void addToSearchResultsImages(HomeMemesImageStruct item) =>
      searchResultsImages.add(item);
  void removeFromSearchResultsImages(HomeMemesImageStruct item) =>
      searchResultsImages.remove(item);
  void removeAtIndexFromSearchResultsImages(int index) =>
      searchResultsImages.removeAt(index);
  void insertAtIndexInSearchResultsImages(
          int index, HomeMemesImageStruct item) =>
      searchResultsImages.insert(index, item);
  void updateSearchResultsImagesAtIndex(
          int index, Function(HomeMemesImageStruct) updateFn) =>
      searchResultsImages[index] = updateFn(searchResultsImages[index]);

  List<HomeMemeVideoStruct> searchResultsVideos = [];
  void addToSearchResultsVideos(HomeMemeVideoStruct item) =>
      searchResultsVideos.add(item);
  void removeFromSearchResultsVideos(HomeMemeVideoStruct item) =>
      searchResultsVideos.remove(item);
  void removeAtIndexFromSearchResultsVideos(int index) =>
      searchResultsVideos.removeAt(index);
  void insertAtIndexInSearchResultsVideos(
          int index, HomeMemeVideoStruct item) =>
      searchResultsVideos.insert(index, item);
  void updateSearchResultsVideosAtIndex(
          int index, Function(HomeMemeVideoStruct) updateFn) =>
      searchResultsVideos[index] = updateFn(searchResultsVideos[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ImagesGridView widget.

  PagingController<ApiPagingParams, dynamic>? imagesGridViewPagingController;
  Function(ApiPagingParams nextPageMarker)? imagesGridViewApiCall;

  // State field(s) for VideosGridView widget.

  PagingController<ApiPagingParams, dynamic>? videosGridViewPagingController;
  Function(ApiPagingParams nextPageMarker)? videosGridViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
    imagesGridViewPagingController?.dispose();
    videosGridViewPagingController?.dispose();
  }

  /// Additional helper methods.
  Future waitForOnePageForImagesGridView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (imagesGridViewPagingController?.nextPageKey?.nextPageNumber ?? 0) >
              0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForOnePageForVideosGridView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (videosGridViewPagingController?.nextPageKey?.nextPageNumber ?? 0) >
              0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setImagesGridViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    imagesGridViewApiCall = apiCall;
    return imagesGridViewPagingController ??=
        _createImagesGridViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createImagesGridViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller
      ..addPageRequestListener(imagesGridViewHomeMemesImagesPage);
  }

  void imagesGridViewHomeMemesImagesPage(ApiPagingParams nextPageMarker) =>
      imagesGridViewApiCall!(nextPageMarker)
          .then((imagesGridViewHomeMemesImagesResponse) {
        final pageItems = (HomeMemesImagesCall.homeMemesImages(
                  imagesGridViewHomeMemesImagesResponse.jsonBody,
                )! ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        imagesGridViewPagingController?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: imagesGridViewHomeMemesImagesResponse,
                )
              : null,
        );
      });

  PagingController<ApiPagingParams, dynamic> setVideosGridViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    videosGridViewApiCall = apiCall;
    return videosGridViewPagingController ??=
        _createVideosGridViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createVideosGridViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller
      ..addPageRequestListener(videosGridViewHomeMemesVideosPage);
  }

  void videosGridViewHomeMemesVideosPage(ApiPagingParams nextPageMarker) =>
      videosGridViewApiCall!(nextPageMarker)
          .then((videosGridViewHomeMemesVideosResponse) {
        final pageItems = (HomeMemesVideosCall.homeMemesVideos(
                  videosGridViewHomeMemesVideosResponse.jsonBody,
                )! ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        videosGridViewPagingController?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: videosGridViewHomeMemesVideosResponse,
                )
              : null,
        );
      });
}
