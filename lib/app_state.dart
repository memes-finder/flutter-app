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

  List<MemesSearchStruct> _searchResults = [];
  List<MemesSearchStruct> get searchResults => _searchResults;
  set searchResults(List<MemesSearchStruct> value) {
    _searchResults = value;
  }

  void addToSearchResults(MemesSearchStruct value) {
    searchResults.add(value);
  }

  void removeFromSearchResults(MemesSearchStruct value) {
    searchResults.remove(value);
  }

  void removeAtIndexFromSearchResults(int index) {
    searchResults.removeAt(index);
  }

  void updateSearchResultsAtIndex(
    int index,
    MemesSearchStruct Function(MemesSearchStruct) updateFn,
  ) {
    searchResults[index] = updateFn(_searchResults[index]);
  }

  void insertAtIndexInSearchResults(int index, MemesSearchStruct value) {
    searchResults.insert(index, value);
  }

  List<HomeMemesImageStruct> _searchImagesAppState = [];
  List<HomeMemesImageStruct> get searchImagesAppState => _searchImagesAppState;
  set searchImagesAppState(List<HomeMemesImageStruct> value) {
    _searchImagesAppState = value;
  }

  void addToSearchImagesAppState(HomeMemesImageStruct value) {
    searchImagesAppState.add(value);
  }

  void removeFromSearchImagesAppState(HomeMemesImageStruct value) {
    searchImagesAppState.remove(value);
  }

  void removeAtIndexFromSearchImagesAppState(int index) {
    searchImagesAppState.removeAt(index);
  }

  void updateSearchImagesAppStateAtIndex(
    int index,
    HomeMemesImageStruct Function(HomeMemesImageStruct) updateFn,
  ) {
    searchImagesAppState[index] = updateFn(_searchImagesAppState[index]);
  }

  void insertAtIndexInSearchImagesAppState(
      int index, HomeMemesImageStruct value) {
    searchImagesAppState.insert(index, value);
  }

  List<HomeMemeVideoStruct> _searchVideosAppState = [];
  List<HomeMemeVideoStruct> get searchVideosAppState => _searchVideosAppState;
  set searchVideosAppState(List<HomeMemeVideoStruct> value) {
    _searchVideosAppState = value;
  }

  void addToSearchVideosAppState(HomeMemeVideoStruct value) {
    searchVideosAppState.add(value);
  }

  void removeFromSearchVideosAppState(HomeMemeVideoStruct value) {
    searchVideosAppState.remove(value);
  }

  void removeAtIndexFromSearchVideosAppState(int index) {
    searchVideosAppState.removeAt(index);
  }

  void updateSearchVideosAppStateAtIndex(
    int index,
    HomeMemeVideoStruct Function(HomeMemeVideoStruct) updateFn,
  ) {
    searchVideosAppState[index] = updateFn(_searchVideosAppState[index]);
  }

  void insertAtIndexInSearchVideosAppState(
      int index, HomeMemeVideoStruct value) {
    searchVideosAppState.insert(index, value);
  }
}
