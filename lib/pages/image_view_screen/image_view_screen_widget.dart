import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/meme_tags_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:octo_image/octo_image.dart';
import 'image_view_screen_model.dart';
export 'image_view_screen_model.dart';

class ImageViewScreenWidget extends StatefulWidget {
  const ImageViewScreenWidget({
    super.key,
    required this.imageMeme,
  });

  final HomeMemesImageStruct? imageMeme;

  @override
  State<ImageViewScreenWidget> createState() => _ImageViewScreenWidgetState();
}

class _ImageViewScreenWidgetState extends State<ImageViewScreenWidget> {
  late ImageViewScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageViewScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await action_blocks.increaseMemeView(
            context,
            id: widget.imageMeme?.id,
          );
        }(),
      );
      // Update local state
      _model.updateImageMemeLocalStruct(
        (e) => e..incrementViewsCount(1),
      );
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: MemeTagsBottomSheetWidget(
                  memeTags: widget.imageMeme!.tags,
                  memeId: widget.imageMeme!.id,
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        },
        backgroundColor: FlutterFlowTheme.of(context).primary,
        elevation: 8.0,
        child: Icon(
          Icons.label_outline,
          color: FlutterFlowTheme.of(context).info,
          size: 24.0,
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: true,
        title: Text(
          'View Image',
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OctoImage(
                      placeholderBuilder: (_) => SizedBox.expand(
                        child: Image(
                          image: BlurHashImage(widget.imageMeme!.blurHash),
                          fit: BoxFit.cover,
                        ),
                      ),
                      image: CachedNetworkImageProvider(
                        getJsonField(
                          widget.imageMeme!.toMap(),
                          r'''$.url''',
                        ).toString(),
                      ),
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      fit: BoxFit.fitWidth,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Future.wait([
                                      Future(() async {
                                        _model.updateImageMemeLocalStruct(
                                          (e) => e..incrementLaughsCount(1),
                                        );
                                        safeSetState(() {});
                                      }),
                                      Future(() async {
                                        unawaited(
                                          () async {
                                            await MemePostLaughCall.call(
                                              id: widget.imageMeme?.id,
                                            );
                                          }(),
                                        );
                                      }),
                                    ]);
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.solidLaughSquint,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 22.0,
                                  ),
                                ),
                              ),
                              AnimatedDefaultTextStyle(
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                    ),
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.bounceOut,
                                child: Text(
                                  valueOrDefault<String>(
                                    _model.imageMemeLocal?.laughsCount
                                        .toString(),
                                    '0',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: Icon(
                                  Icons.remove_red_eye,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 25.0,
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget.imageMeme?.viewsCount.toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 30.0,
                            fillColor: FlutterFlowTheme.of(context).secondary,
                            icon: Icon(
                              Icons.download,
                              color: FlutterFlowTheme.of(context).info,
                              size: 15.0,
                            ),
                            onPressed: () async {
                              _model.apiResult69v = await DownloadMemeCall.call(
                                id: valueOrDefault<String>(
                                  widget.imageMeme?.id,
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
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }

                              safeSetState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FlutterFlowChoiceChips(
                                options: widget.imageMeme!.tags.secondary
                                    .map((label) => ChipData(label))
                                    .toList(),
                                onChanged: (val) => safeSetState(() =>
                                    _model.choiceChipsValue = val?.firstOrNull),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                  iconColor: FlutterFlowTheme.of(context).info,
                                  iconSize: 13.0,
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                  iconColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  iconSize: 13.0,
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                chipSpacing: 8.0,
                                rowSpacing: 8.0,
                                multiselect: false,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.choiceChipsValueController ??=
                                        FormFieldController<List<String>>(
                                  [],
                                ),
                                wrapped: true,
                              ),
                            ),
                          ],
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
    );
  }
}
