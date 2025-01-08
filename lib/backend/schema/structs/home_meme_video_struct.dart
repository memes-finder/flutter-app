// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HomeMemeVideoStruct extends BaseStruct {
  HomeMemeVideoStruct({
    String? id,
    String? width,
    String? height,
    String? url,
    MemeTagsStruct? tags,
    String? thumbnail,
  })  : _id = id,
        _width = width,
        _height = height,
        _url = url,
        _tags = tags,
        _thumbnail = thumbnail;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "width" field.
  String? _width;
  String get width => _width ?? '';
  set width(String? val) => _width = val;

  bool hasWidth() => _width != null;

  // "height" field.
  String? _height;
  String get height => _height ?? '';
  set height(String? val) => _height = val;

  bool hasHeight() => _height != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "tags" field.
  MemeTagsStruct? _tags;
  MemeTagsStruct get tags => _tags ?? MemeTagsStruct();
  set tags(MemeTagsStruct? val) => _tags = val;

  void updateTags(Function(MemeTagsStruct) updateFn) {
    updateFn(_tags ??= MemeTagsStruct());
  }

  bool hasTags() => _tags != null;

  // "thumbnail" field.
  String? _thumbnail;
  String get thumbnail => _thumbnail ?? '';
  set thumbnail(String? val) => _thumbnail = val;

  bool hasThumbnail() => _thumbnail != null;

  static HomeMemeVideoStruct fromMap(Map<String, dynamic> data) =>
      HomeMemeVideoStruct(
        id: data['id'] as String?,
        width: data['width'] as String?,
        height: data['height'] as String?,
        url: data['url'] as String?,
        tags: data['tags'] is MemeTagsStruct
            ? data['tags']
            : MemeTagsStruct.maybeFromMap(data['tags']),
        thumbnail: data['thumbnail'] as String?,
      );

  static HomeMemeVideoStruct? maybeFromMap(dynamic data) => data is Map
      ? HomeMemeVideoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'width': _width,
        'height': _height,
        'url': _url,
        'tags': _tags?.toMap(),
        'thumbnail': _thumbnail,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'width': serializeParam(
          _width,
          ParamType.String,
        ),
        'height': serializeParam(
          _height,
          ParamType.String,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'tags': serializeParam(
          _tags,
          ParamType.DataStruct,
        ),
        'thumbnail': serializeParam(
          _thumbnail,
          ParamType.String,
        ),
      }.withoutNulls;

  static HomeMemeVideoStruct fromSerializableMap(Map<String, dynamic> data) =>
      HomeMemeVideoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        width: deserializeParam(
          data['width'],
          ParamType.String,
          false,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.String,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        tags: deserializeStructParam(
          data['tags'],
          ParamType.DataStruct,
          false,
          structBuilder: MemeTagsStruct.fromSerializableMap,
        ),
        thumbnail: deserializeParam(
          data['thumbnail'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HomeMemeVideoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HomeMemeVideoStruct &&
        id == other.id &&
        width == other.width &&
        height == other.height &&
        url == other.url &&
        tags == other.tags &&
        thumbnail == other.thumbnail;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, width, height, url, tags, thumbnail]);
}

HomeMemeVideoStruct createHomeMemeVideoStruct({
  String? id,
  String? width,
  String? height,
  String? url,
  MemeTagsStruct? tags,
  String? thumbnail,
}) =>
    HomeMemeVideoStruct(
      id: id,
      width: width,
      height: height,
      url: url,
      tags: tags ?? MemeTagsStruct(),
      thumbnail: thumbnail,
    );
