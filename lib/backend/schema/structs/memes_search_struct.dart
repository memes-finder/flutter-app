// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MemesSearchStruct extends BaseStruct {
  MemesSearchStruct({
    String? id,
    String? url,
    String? width,
    String? height,
    String? thumbnail,
    MemeTagsStruct? tags,
    int? laughsCount,
    int? viewsCount,
    String? type,
  })  : _id = id,
        _url = url,
        _width = width,
        _height = height,
        _thumbnail = thumbnail,
        _tags = tags,
        _laughsCount = laughsCount,
        _viewsCount = viewsCount,
        _type = type;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

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

  // "thumbnail" field.
  String? _thumbnail;
  String get thumbnail => _thumbnail ?? '';
  set thumbnail(String? val) => _thumbnail = val;

  bool hasThumbnail() => _thumbnail != null;

  // "tags" field.
  MemeTagsStruct? _tags;
  MemeTagsStruct get tags => _tags ?? MemeTagsStruct();
  set tags(MemeTagsStruct? val) => _tags = val;

  void updateTags(Function(MemeTagsStruct) updateFn) {
    updateFn(_tags ??= MemeTagsStruct());
  }

  bool hasTags() => _tags != null;

  // "laughs_count" field.
  int? _laughsCount;
  int get laughsCount => _laughsCount ?? 0;
  set laughsCount(int? val) => _laughsCount = val;

  void incrementLaughsCount(int amount) => laughsCount = laughsCount + amount;

  bool hasLaughsCount() => _laughsCount != null;

  // "views_count" field.
  int? _viewsCount;
  int get viewsCount => _viewsCount ?? 0;
  set viewsCount(int? val) => _viewsCount = val;

  void incrementViewsCount(int amount) => viewsCount = viewsCount + amount;

  bool hasViewsCount() => _viewsCount != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  static MemesSearchStruct fromMap(Map<String, dynamic> data) =>
      MemesSearchStruct(
        id: data['id'] as String?,
        url: data['url'] as String?,
        width: data['width'] as String?,
        height: data['height'] as String?,
        thumbnail: data['thumbnail'] as String?,
        tags: data['tags'] is MemeTagsStruct
            ? data['tags']
            : MemeTagsStruct.maybeFromMap(data['tags']),
        laughsCount: castToType<int>(data['laughs_count']),
        viewsCount: castToType<int>(data['views_count']),
        type: data['type'] as String?,
      );

  static MemesSearchStruct? maybeFromMap(dynamic data) => data is Map
      ? MemesSearchStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'url': _url,
        'width': _width,
        'height': _height,
        'thumbnail': _thumbnail,
        'tags': _tags?.toMap(),
        'laughs_count': _laughsCount,
        'views_count': _viewsCount,
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'url': serializeParam(
          _url,
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
        'thumbnail': serializeParam(
          _thumbnail,
          ParamType.String,
        ),
        'tags': serializeParam(
          _tags,
          ParamType.DataStruct,
        ),
        'laughs_count': serializeParam(
          _laughsCount,
          ParamType.int,
        ),
        'views_count': serializeParam(
          _viewsCount,
          ParamType.int,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static MemesSearchStruct fromSerializableMap(Map<String, dynamic> data) =>
      MemesSearchStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        url: deserializeParam(
          data['url'],
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
        thumbnail: deserializeParam(
          data['thumbnail'],
          ParamType.String,
          false,
        ),
        tags: deserializeStructParam(
          data['tags'],
          ParamType.DataStruct,
          false,
          structBuilder: MemeTagsStruct.fromSerializableMap,
        ),
        laughsCount: deserializeParam(
          data['laughs_count'],
          ParamType.int,
          false,
        ),
        viewsCount: deserializeParam(
          data['views_count'],
          ParamType.int,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MemesSearchStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MemesSearchStruct &&
        id == other.id &&
        url == other.url &&
        width == other.width &&
        height == other.height &&
        thumbnail == other.thumbnail &&
        tags == other.tags &&
        laughsCount == other.laughsCount &&
        viewsCount == other.viewsCount &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, url, width, height, thumbnail, tags, laughsCount, viewsCount, type]);
}

MemesSearchStruct createMemesSearchStruct({
  String? id,
  String? url,
  String? width,
  String? height,
  String? thumbnail,
  MemeTagsStruct? tags,
  int? laughsCount,
  int? viewsCount,
  String? type,
}) =>
    MemesSearchStruct(
      id: id,
      url: url,
      width: width,
      height: height,
      thumbnail: thumbnail,
      tags: tags ?? MemeTagsStruct(),
      laughsCount: laughsCount,
      viewsCount: viewsCount,
      type: type,
    );
