import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'carousel_meme_primary_tags_model.dart';
export 'carousel_meme_primary_tags_model.dart';

class CarouselMemePrimaryTagsWidget extends StatefulWidget {
  const CarouselMemePrimaryTagsWidget({
    super.key,
    this.parameter1,
  });

  final List<String>? parameter1;

  @override
  State<CarouselMemePrimaryTagsWidget> createState() =>
      _CarouselMemePrimaryTagsWidgetState();
}

class _CarouselMemePrimaryTagsWidgetState
    extends State<CarouselMemePrimaryTagsWidget> {
  late CarouselMemePrimaryTagsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarouselMemePrimaryTagsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-1.0, 0.0),
      child: FlutterFlowChoiceChips(
        options: widget.parameter1!
            .take(10)
            .toList()
            .map((label) => ChipData(label))
            .toList(),
        onChanged: (val) =>
            safeSetState(() => _model.choiceChipsValue = val?.firstOrNull),
        selectedChipStyle: ChipStyle(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                color: FlutterFlowTheme.of(context).info,
                fontSize: 10.0,
                letterSpacing: 0.0,
              ),
          iconColor: FlutterFlowTheme.of(context).info,
          iconSize: 16.0,
          elevation: 0.0,
          borderRadius: BorderRadius.circular(8.0),
        ),
        unselectedChipStyle: ChipStyle(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 10.0,
                letterSpacing: 0.0,
              ),
          iconColor: FlutterFlowTheme.of(context).secondaryText,
          iconSize: 16.0,
          elevation: 0.0,
          borderRadius: BorderRadius.circular(8.0),
        ),
        chipSpacing: 8.0,
        rowSpacing: 8.0,
        multiselect: false,
        alignment: WrapAlignment.start,
        controller: _model.choiceChipsValueController ??=
            FormFieldController<List<String>>(
          [],
        ),
        wrapped: false,
      ),
    );
  }
}
