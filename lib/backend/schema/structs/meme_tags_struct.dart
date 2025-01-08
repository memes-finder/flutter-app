// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MemeTagsStruct extends BaseStruct {
  MemeTagsStruct({
    List<String>? primary,
    List<String>? secondary,
  })  : _primary = primary,
        _secondary = secondary;

  // "primary" field.
  List<String>? _primary;
  List<String> get primary => _primary ?? const [];
  set primary(List<String>? val) => _primary = val;

  void updatePrimary(Function(List<String>) updateFn) {
    updateFn(_primary ??= []);
  }

  bool hasPrimary() => _primary != null;

  // "secondary" field.
  List<String>? _secondary;
  List<String> get secondary => _secondary ?? const [];
  set secondary(List<String>? val) => _secondary = val;

  void updateSecondary(Function(List<String>) updateFn) {
    updateFn(_secondary ??= []);
  }

  bool hasSecondary() => _secondary != null;

  static MemeTagsStruct fromMap(Map<String, dynamic> data) => MemeTagsStruct(
        primary: getDataList(data['primary']),
        secondary: getDataList(data['secondary']),
      );

  static MemeTagsStruct? maybeFromMap(dynamic data) =>
      data is Map ? MemeTagsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'primary': _primary,
        'secondary': _secondary,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'primary': serializeParam(
          _primary,
          ParamType.String,
          isList: true,
        ),
        'secondary': serializeParam(
          _secondary,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static MemeTagsStruct fromSerializableMap(Map<String, dynamic> data) =>
      MemeTagsStruct(
        primary: deserializeParam<String>(
          data['primary'],
          ParamType.String,
          true,
        ),
        secondary: deserializeParam<String>(
          data['secondary'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'MemeTagsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MemeTagsStruct &&
        listEquality.equals(primary, other.primary) &&
        listEquality.equals(secondary, other.secondary);
  }

  @override
  int get hashCode => const ListEquality().hash([primary, secondary]);
}

MemeTagsStruct createMemeTagsStruct() => MemeTagsStruct();
