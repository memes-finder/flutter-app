import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'meme_tags_bottom_sheet_widget.dart' show MemeTagsBottomSheetWidget;
import 'package:flutter/material.dart';

class MemeTagsBottomSheetModel
    extends FlutterFlowModel<MemeTagsBottomSheetWidget> {
  ///  Local state fields for this component.

  List<String> tagsInput = [];
  void addToTagsInput(String item) => tagsInput.add(item);
  void removeFromTagsInput(String item) => tagsInput.remove(item);
  void removeAtIndexFromTagsInput(int index) => tagsInput.removeAt(index);
  void insertAtIndexInTagsInput(int index, String item) =>
      tagsInput.insert(index, item);
  void updateTagsInputAtIndex(int index, Function(String) updateFn) =>
      tagsInput[index] = updateFn(tagsInput[index]);

  bool isAddTags = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Add Tags)] action in Button widget.
  ApiCallResponse? apiResultnpz;
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
