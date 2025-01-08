import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<TrendingTagsItemStruct> _trendingTagsAppState = [];
  List<TrendingTagsItemStruct> get trendingTagsAppState =>
      _trendingTagsAppState;
  set trendingTagsAppState(List<TrendingTagsItemStruct> value) {
    _trendingTagsAppState = value;
  }

  void addToTrendingTagsAppState(TrendingTagsItemStruct value) {
    trendingTagsAppState.add(value);
  }

  void removeFromTrendingTagsAppState(TrendingTagsItemStruct value) {
    trendingTagsAppState.remove(value);
  }

  void removeAtIndexFromTrendingTagsAppState(int index) {
    trendingTagsAppState.removeAt(index);
  }

  void updateTrendingTagsAppStateAtIndex(
    int index,
    TrendingTagsItemStruct Function(TrendingTagsItemStruct) updateFn,
  ) {
    trendingTagsAppState[index] = updateFn(_trendingTagsAppState[index]);
  }

  void insertAtIndexInTrendingTagsAppState(
      int index, TrendingTagsItemStruct value) {
    trendingTagsAppState.insert(index, value);
  }

  List<HomeMemesImageStruct> _homeImagesAppState = [];
  List<HomeMemesImageStruct> get homeImagesAppState => _homeImagesAppState;
  set homeImagesAppState(List<HomeMemesImageStruct> value) {
    _homeImagesAppState = value;
  }

  void addToHomeImagesAppState(HomeMemesImageStruct value) {
    homeImagesAppState.add(value);
  }

  void removeFromHomeImagesAppState(HomeMemesImageStruct value) {
    homeImagesAppState.remove(value);
  }

  void removeAtIndexFromHomeImagesAppState(int index) {
    homeImagesAppState.removeAt(index);
  }

  void updateHomeImagesAppStateAtIndex(
    int index,
    HomeMemesImageStruct Function(HomeMemesImageStruct) updateFn,
  ) {
    homeImagesAppState[index] = updateFn(_homeImagesAppState[index]);
  }

  void insertAtIndexInHomeImagesAppState(
      int index, HomeMemesImageStruct value) {
    homeImagesAppState.insert(index, value);
  }

  List<HomeMemeVideoStruct> _homeVideosAppState = [];
  List<HomeMemeVideoStruct> get homeVideosAppState => _homeVideosAppState;
  set homeVideosAppState(List<HomeMemeVideoStruct> value) {
    _homeVideosAppState = value;
  }

  void addToHomeVideosAppState(HomeMemeVideoStruct value) {
    homeVideosAppState.add(value);
  }

  void removeFromHomeVideosAppState(HomeMemeVideoStruct value) {
    homeVideosAppState.remove(value);
  }

  void removeAtIndexFromHomeVideosAppState(int index) {
    homeVideosAppState.removeAt(index);
  }

  void updateHomeVideosAppStateAtIndex(
    int index,
    HomeMemeVideoStruct Function(HomeMemeVideoStruct) updateFn,
  ) {
    homeVideosAppState[index] = updateFn(_homeVideosAppState[index]);
  }

  void insertAtIndexInHomeVideosAppState(int index, HomeMemeVideoStruct value) {
    homeVideosAppState.insert(index, value);
  }
}
