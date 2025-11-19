// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Episode {
  String get id;
  String get videoPath;
  @DurationMsConverter()
  Duration get startOffset;
  @DurationMsConverter()
  Duration get endOffset;
  String get screenshotPath;
  String get drawingJson;
  DateTime get createdAt;

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EpisodeCopyWith<Episode> get copyWith =>
      _$EpisodeCopyWithImpl<Episode>(this as Episode, _$identity);

  /// Serializes this Episode to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Episode &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.videoPath, videoPath) ||
                other.videoPath == videoPath) &&
            (identical(other.startOffset, startOffset) ||
                other.startOffset == startOffset) &&
            (identical(other.endOffset, endOffset) ||
                other.endOffset == endOffset) &&
            (identical(other.screenshotPath, screenshotPath) ||
                other.screenshotPath == screenshotPath) &&
            (identical(other.drawingJson, drawingJson) ||
                other.drawingJson == drawingJson) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, videoPath, startOffset,
      endOffset, screenshotPath, drawingJson, createdAt);

  @override
  String toString() {
    return 'Episode(id: $id, videoPath: $videoPath, startOffset: $startOffset, endOffset: $endOffset, screenshotPath: $screenshotPath, drawingJson: $drawingJson, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $EpisodeCopyWith<$Res> {
  factory $EpisodeCopyWith(Episode value, $Res Function(Episode) _then) =
      _$EpisodeCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String videoPath,
      @DurationMsConverter() Duration startOffset,
      @DurationMsConverter() Duration endOffset,
      String screenshotPath,
      String drawingJson,
      DateTime createdAt});
}

/// @nodoc
class _$EpisodeCopyWithImpl<$Res> implements $EpisodeCopyWith<$Res> {
  _$EpisodeCopyWithImpl(this._self, this._then);

  final Episode _self;
  final $Res Function(Episode) _then;

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? videoPath = null,
    Object? startOffset = null,
    Object? endOffset = null,
    Object? screenshotPath = null,
    Object? drawingJson = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      videoPath: null == videoPath
          ? _self.videoPath
          : videoPath // ignore: cast_nullable_to_non_nullable
              as String,
      startOffset: null == startOffset
          ? _self.startOffset
          : startOffset // ignore: cast_nullable_to_non_nullable
              as Duration,
      endOffset: null == endOffset
          ? _self.endOffset
          : endOffset // ignore: cast_nullable_to_non_nullable
              as Duration,
      screenshotPath: null == screenshotPath
          ? _self.screenshotPath
          : screenshotPath // ignore: cast_nullable_to_non_nullable
              as String,
      drawingJson: null == drawingJson
          ? _self.drawingJson
          : drawingJson // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Episode implements Episode {
  const _Episode(
      {required this.id,
      required this.videoPath,
      @DurationMsConverter() required this.startOffset,
      @DurationMsConverter() required this.endOffset,
      required this.screenshotPath,
      required this.drawingJson,
      required this.createdAt});
  factory _Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  @override
  final String id;
  @override
  final String videoPath;
  @override
  @DurationMsConverter()
  final Duration startOffset;
  @override
  @DurationMsConverter()
  final Duration endOffset;
  @override
  final String screenshotPath;
  @override
  final String drawingJson;
  @override
  final DateTime createdAt;

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EpisodeCopyWith<_Episode> get copyWith =>
      __$EpisodeCopyWithImpl<_Episode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EpisodeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Episode &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.videoPath, videoPath) ||
                other.videoPath == videoPath) &&
            (identical(other.startOffset, startOffset) ||
                other.startOffset == startOffset) &&
            (identical(other.endOffset, endOffset) ||
                other.endOffset == endOffset) &&
            (identical(other.screenshotPath, screenshotPath) ||
                other.screenshotPath == screenshotPath) &&
            (identical(other.drawingJson, drawingJson) ||
                other.drawingJson == drawingJson) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, videoPath, startOffset,
      endOffset, screenshotPath, drawingJson, createdAt);

  @override
  String toString() {
    return 'Episode(id: $id, videoPath: $videoPath, startOffset: $startOffset, endOffset: $endOffset, screenshotPath: $screenshotPath, drawingJson: $drawingJson, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$EpisodeCopyWith<$Res> implements $EpisodeCopyWith<$Res> {
  factory _$EpisodeCopyWith(_Episode value, $Res Function(_Episode) _then) =
      __$EpisodeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String videoPath,
      @DurationMsConverter() Duration startOffset,
      @DurationMsConverter() Duration endOffset,
      String screenshotPath,
      String drawingJson,
      DateTime createdAt});
}

/// @nodoc
class __$EpisodeCopyWithImpl<$Res> implements _$EpisodeCopyWith<$Res> {
  __$EpisodeCopyWithImpl(this._self, this._then);

  final _Episode _self;
  final $Res Function(_Episode) _then;

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? videoPath = null,
    Object? startOffset = null,
    Object? endOffset = null,
    Object? screenshotPath = null,
    Object? drawingJson = null,
    Object? createdAt = null,
  }) {
    return _then(_Episode(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      videoPath: null == videoPath
          ? _self.videoPath
          : videoPath // ignore: cast_nullable_to_non_nullable
              as String,
      startOffset: null == startOffset
          ? _self.startOffset
          : startOffset // ignore: cast_nullable_to_non_nullable
              as Duration,
      endOffset: null == endOffset
          ? _self.endOffset
          : endOffset // ignore: cast_nullable_to_non_nullable
              as Duration,
      screenshotPath: null == screenshotPath
          ? _self.screenshotPath
          : screenshotPath // ignore: cast_nullable_to_non_nullable
              as String,
      drawingJson: null == drawingJson
          ? _self.drawingJson
          : drawingJson // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
