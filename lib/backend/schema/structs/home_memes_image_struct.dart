// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HomeMemesImageStruct extends BaseStruct {
  HomeMemesImageStruct({
    String? id,
    String? width,
    String? height,
    String? url,
    MemeTagsStruct? tags,
    int? laughsCount,
    int? viewsCount,
    String? type,
    String? blurHash,
  })  : _id = id,
        _width = width,
        _height = height,
        _url = url,
        _tags = tags,
        _laughsCount = laughsCount,
        _viewsCount = viewsCount,
        _type = type,
        _blurHash = blurHash;

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
  String get type => _type ?? 'image';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "blur_hash" field.
  String? _blurHash;
  String get blurHash => _blurHash ?? '';
  set blurHash(String? val) => _blurHash = val;

  bool hasBlurHash() => _blurHash != null;

  static HomeMemesImageStruct fromMap(Map<String, dynamic> data) =>
      HomeMemesImageStruct(
        id: data['id'] as String?,
        width: data['width'] as String?,
        height: data['height'] as String?,
        url: data['url'] as String?,
        tags: data['tags'] is MemeTagsStruct
            ? data['tags']
            : MemeTagsStruct.maybeFromMap(data['tags']),
        laughsCount: castToType<int>(data['laughs_count']),
        viewsCount: castToType<int>(data['views_count']),
        type: data['type'] as String?,
        blurHash: data['blur_hash'] as String?,
      );

  static HomeMemesImageStruct? maybeFromMap(dynamic data) => data is Map
      ? HomeMemesImageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'width': _width,
        'height': _height,
        'url': _url,
        'tags': _tags?.toMap(),
        'laughs_count': _laughsCount,
        'views_count': _viewsCount,
        'type': _type,
        'blur_hash': _blurHash,
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
        'blur_hash': serializeParam(
          _blurHash,
          ParamType.String,
        ),
      }.withoutNulls;

  static HomeMemesImageStruct fromSerializableMap(Map<String, dynamic> data) =>
      HomeMemesImageStruct(
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
        blurHash: deserializeParam(
          data['blur_hash'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HomeMemesImageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HomeMemesImageStruct &&
        id == other.id &&
        width == other.width &&
        height == other.height &&
        url == other.url &&
        tags == other.tags &&
        laughsCount == other.laughsCount &&
        viewsCount == other.viewsCount &&
        type == other.type &&
        blurHash == other.blurHash;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, width, height, url, tags, laughsCount, viewsCount, type, blurHash]);
}

HomeMemesImageStruct createHomeMemesImageStruct({
  String? id,
  String? width,
  String? height,
  String? url,
  MemeTagsStruct? tags,
  int? laughsCount,
  int? viewsCount,
  String? type,
  String? blurHash,
}) =>
    HomeMemesImageStruct(
      id: id,
      width: width,
      height: height,
      url: url,
      tags: tags ?? MemeTagsStruct(),
      laughsCount: laughsCount,
      viewsCount: viewsCount,
      type: type,
      blurHash: blurHash,
    );
