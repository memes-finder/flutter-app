// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SuggestedTagsItemStruct extends BaseStruct {
  SuggestedTagsItemStruct({
    String? tag,
    int? usagecount,
  })  : _tag = tag,
        _usagecount = usagecount;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  set tag(String? val) => _tag = val;

  bool hasTag() => _tag != null;

  // "usagecount" field.
  int? _usagecount;
  int get usagecount => _usagecount ?? 0;
  set usagecount(int? val) => _usagecount = val;

  void incrementUsagecount(int amount) => usagecount = usagecount + amount;

  bool hasUsagecount() => _usagecount != null;

  static SuggestedTagsItemStruct fromMap(Map<String, dynamic> data) =>
      SuggestedTagsItemStruct(
        tag: data['tag'] as String?,
        usagecount: castToType<int>(data['usagecount']),
      );

  static SuggestedTagsItemStruct? maybeFromMap(dynamic data) => data is Map
      ? SuggestedTagsItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tag': _tag,
        'usagecount': _usagecount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tag': serializeParam(
          _tag,
          ParamType.String,
        ),
        'usagecount': serializeParam(
          _usagecount,
          ParamType.int,
        ),
      }.withoutNulls;

  static SuggestedTagsItemStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SuggestedTagsItemStruct(
        tag: deserializeParam(
          data['tag'],
          ParamType.String,
          false,
        ),
        usagecount: deserializeParam(
          data['usagecount'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SuggestedTagsItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SuggestedTagsItemStruct &&
        tag == other.tag &&
        usagecount == other.usagecount;
  }

  @override
  int get hashCode => const ListEquality().hash([tag, usagecount]);
}

SuggestedTagsItemStruct createSuggestedTagsItemStruct({
  String? tag,
  int? usagecount,
}) =>
    SuggestedTagsItemStruct(
      tag: tag,
      usagecount: usagecount,
    );
