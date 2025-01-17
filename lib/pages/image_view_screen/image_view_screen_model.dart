import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'image_view_screen_widget.dart' show ImageViewScreenWidget;
import 'package:flutter/material.dart';

class ImageViewScreenModel extends FlutterFlowModel<ImageViewScreenWidget> {
  ///  Local state fields for this page.

  HomeMemesImageStruct? imageMemeLocal;
  void updateImageMemeLocalStruct(Function(HomeMemesImageStruct) updateFn) {
    updateFn(imageMemeLocal ??= HomeMemesImageStruct());
  }

  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
