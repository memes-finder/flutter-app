import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/meme_tags_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

class _VideoPlayerScreenWidgetState extends State<VideoPlayerScreenWidget>
    with TickerProviderStateMixin {
  late VideoPlayerScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

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
      _model.videoMemeLocal = widget.videoMeme;
      safeSetState(() {});
    });

    animationsMap.addAll({
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
                                                        memeId: nextPageMarker
                                                                    .nextPageNumber ==
                                                                0
                                                            ? widget
                                                                .videoMeme?.id
                                                            : '',
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
                                                    onPageChanged: (_) async {
                                                      _model.pageViewLoadedLength =
                                                          _model
                                                              .pageViewPagingController!
                                                              .itemList!
                                                              .length;
                                                      _model.videoMemeLocal =
                                                          homeMemeVideosItem
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .pageViewCurrentIndex);
                                                      safeSetState(() {});
                                                    },
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
                                                                            blurHash:
                                                                                homeMemeVideosItemItem.blurHash,
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
                                                                          30.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Opacity(
                                                                              opacity: 0.5,
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                child: Container(
                                                                                  width: 50.0,
                                                                                  height: 30.0,
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
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                child: Icon(
                                                                                                  Icons.remove_red_eye,
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  size: 20.0,
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
                                                                                                      fontSize: 15.0,
                                                                                                      letterSpacing: 0.0,
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
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Opacity(
                                                                              opacity: 0.5,
                                                                              child: Container(
                                                                                width: 50.0,
                                                                                height: 30.0,
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
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
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
                                                                                                size: 17.0,
                                                                                              ),
                                                                                            ).animateOnActionTrigger(
                                                                                              animationsMap['iconOnActionTriggerAnimation']!,
                                                                                            ),
                                                                                          ),
                                                                                          AnimatedDefaultTextStyle(
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).accent4,
                                                                                                  fontSize: 17.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            duration: const Duration(milliseconds: 600),
                                                                                            curve: Curves.bounceOut,
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                _model.videoMemeLocal?.laughsCount.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
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
                                                                                width: 50.0,
                                                                                height: 50.0,
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
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                10.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderRadius: 8.0,
                                                                              buttonSize: 49.0,
                                                                              fillColor: FlutterFlowTheme.of(context).secondary,
                                                                              icon: Icon(
                                                                                Icons.download,
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                _model.apiResult69v = await DownloadMemeCall.call(
                                                                                  id: valueOrDefault<String>(
                                                                                    homeMemeVideosItemItem.id,
                                                                                    '0',
                                                                                  ),
                                                                                );

                                                                                if ((_model.apiResult69v?.succeeded ?? true)) {
                                                                                  await launchURL(DownloadMemeCall.downloadUrl(
                                                                                    (_model.apiResult69v?.jsonBody ?? ''),
                                                                                  )!);
                                                                                } else {
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'Failed to download meme',
                                                                                        style: TextStyle(
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                      ),
                                                                                      duration: const Duration(milliseconds: 4000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                    ),
                                                                                  );
                                                                                }

                                                                                safeSetState(() {});
                                                                              },
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
