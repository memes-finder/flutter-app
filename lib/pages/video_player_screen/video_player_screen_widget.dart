import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/meme_tags_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'video_player_screen_model.dart';
export 'video_player_screen_model.dart';

class VideoPlayerScreenWidget extends StatefulWidget {
  const VideoPlayerScreenWidget({
    super.key,
    this.videoMeme,
  });

  final HomeMemeVideoStruct? videoMeme;

  @override
  State<VideoPlayerScreenWidget> createState() =>
      _VideoPlayerScreenWidgetState();
}

class _VideoPlayerScreenWidgetState extends State<VideoPlayerScreenWidget> {
  late VideoPlayerScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoPlayerScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await action_blocks.increaseMemeView(
            context,
            id: widget.videoMeme?.id,
          );
        }(),
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF0D0D0D),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryText,
          iconTheme: IconThemeData(
              color: FlutterFlowTheme.of(context).secondaryBackground),
          automaticallyImplyLeading: true,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/icon.png',
                    width: 60.0,
                    height: 70.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                'Memes Planet',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter Tight',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: const BoxDecoration(
                              color: Color(0xFF0D0D0D),
                            ),
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Stack(
                                      alignment: const AlignmentDirectional(1.0, 1.0),
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.85,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF0D0D0D),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                tablet: false,
                                                tabletLandscape: false,
                                                desktop: false,
                                              ))
                                                SizedBox(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  child: custom_widgets
                                                      .BetterPlayerWidget(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    videoUrl:
                                                        widget.videoMeme!.url,
                                                  ),
                                                ),
                                              Flexible(
                                                child: SizedBox(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  child: PagedPageView<
                                                      ApiPagingParams, dynamic>(
                                                    pagingController: _model
                                                        .setPageViewController(
                                                      (nextPageMarker) =>
                                                          HomeMemesVideosCall
                                                              .call(
                                                        tags: valueOrDefault<
                                                            String>(
                                                          getJsonField(
                                                            widget
                                                                .videoMeme?.tags
                                                                .toMap(),
                                                            r'''$.secondary''',
                                                          )?.toString(),
                                                          '[]',
                                                        ),
                                                        limit: 1,
                                                        page: nextPageMarker
                                                            .nextPageNumber,
                                                        isAll: true,
                                                      ),
                                                    ),
                                                    pageController: _model
                                                            .pageViewController ??=
                                                        PageController(
                                                            initialPage: max(
                                                                0,
                                                                min(
                                                                    0,
                                                                    _model.pageViewLoadedLength -
                                                                        1))),
                                                    onPageChanged: (_) =>
                                                        safeSetState(() {
                                                      _model.pageViewLoadedLength =
                                                          _model
                                                              .pageViewPagingController!
                                                              .itemList!
                                                              .length;
                                                    }),
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    builderDelegate:
                                                        PagedChildBuilderDelegate<
                                                            dynamic>(
                                                      // Customize what your widget looks like when it's loading the first page.
                                                      firstPageProgressIndicatorBuilder:
                                                          (_) => Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      // Customize what your widget looks like when it's loading another page.
                                                      newPageProgressIndicatorBuilder:
                                                          (_) => Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      ),

                                                      itemBuilder: (context, _,
                                                          homeMemeVideosItemIndex) {
                                                        final homeMemeVideosItemItem =
                                                            _model.pageViewPagingController!
                                                                    .itemList![
                                                                homeMemeVideosItemIndex];
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Flexible(
                                                              child: Stack(
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 1.0,
                                                                          child:
                                                                              custom_widgets.BetterPlayerWidget(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 1.0,
                                                                            videoUrl:
                                                                                homeMemeVideosItemItem.url,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            1.0,
                                                                            1.1),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          15.0,
                                                                          35.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children: [
                                                                          Opacity(
                                                                            opacity:
                                                                                0.5,
                                                                            child:
                                                                                Container(
                                                                              width: 53.0,
                                                                              height: 80.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 10.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                            child: Icon(
                                                                                              Icons.remove_red_eye,
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              size: 25.0,
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              homeMemeVideosItemItem.viewsCount.toString(),
                                                                                              '0',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).accent4,
                                                                                                  fontSize: 20.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                await Future.wait([
                                                                                                  Future(() async {
                                                                                                    _model.updateVideoMemeLocalStruct(
                                                                                                      (e) => e..incrementLaughsCount(1),
                                                                                                    );
                                                                                                    safeSetState(() {});
                                                                                                  }),
                                                                                                  Future(() async {
                                                                                                    unawaited(
                                                                                                      () async {
                                                                                                        await MemePostLaughCall.call(
                                                                                                          id: homeMemeVideosItemItem.id,
                                                                                                        );
                                                                                                      }(),
                                                                                                    );
                                                                                                  }),
                                                                                                ]);
                                                                                              },
                                                                                              child: const FaIcon(
                                                                                                FontAwesomeIcons.solidLaughSquint,
                                                                                                color: Color(0xFFD0A11D),
                                                                                                size: 22.0,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          AnimatedDefaultTextStyle(
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).accent4,
                                                                                                  fontSize: 20.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            duration: const Duration(milliseconds: 600),
                                                                                            curve: Curves.bounceOut,
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                homeMemeVideosItemItem.laughsCount.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                20.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  enableDrag: false,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return GestureDetector(
                                                                                      onTap: () {
                                                                                        FocusScope.of(context).unfocus();
                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                      },
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: MemeTagsBottomSheetWidget(
                                                                                          memeTags: homeMemeVideosItemItem.tags,
                                                                                          memeId: homeMemeVideosItemItem.id,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              },
                                                                              text: '',
                                                                              icon: const Icon(
                                                                                Icons.label_outline,
                                                                                size: 25.0,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                width: 55.0,
                                                                                height: 55.0,
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 5.0, 0.0),
                                                                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Inter Tight',
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
