// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Episode _$EpisodeFromJson(Map<String, dynamic> json) {
  return _Episode.fromJson(json);
}

/// @nodoc
mixin _$Episode {
  String get id => throw _privateConstructorUsedError;
  String get videoPath => throw _privateConstructorUsedError;
  @DurationMsConverter()
  Duration get startOffset => throw _privateConstructorUsedError;
  @DurationMsConverter()
  Duration get endOffset => throw _privateConstructorUsedError;
  String get screenshotPath => throw _privateConstructorUsedError;
  String get drawingJson => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Episode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EpisodeCopyWith<Episode> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeCopyWith<$Res> {
  factory $EpisodeCopyWith(Episode value, $Res Function(Episode) then) =
      _$EpisodeCopyWithImpl<$Res, Episode>;
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
class _$EpisodeCopyWithImpl<$Res, $Val extends Episode>
    implements $EpisodeCopyWith<$Res> {
  _$EpisodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      videoPath: null == videoPath
          ? _value.videoPath
          : videoPath // ignore: cast_nullable_to_non_nullable
              as String,
      startOffset: null == startOffset
          ? _value.startOffset
          : startOffset // ignore: cast_nullable_to_non_nullable
              as Duration,
      endOffset: null == endOffset
          ? _value.endOffset
          : endOffset // ignore: cast_nullable_to_non_nullable
              as Duration,
      screenshotPath: null == screenshotPath
          ? _value.screenshotPath
          : screenshotPath // ignore: cast_nullable_to_non_nullable
              as String,
      drawingJson: null == drawingJson
          ? _value.drawingJson
          : drawingJson // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EpisodeImplCopyWith<$Res> implements $EpisodeCopyWith<$Res> {
  factory _$$EpisodeImplCopyWith(
          _$EpisodeImpl value, $Res Function(_$EpisodeImpl) then) =
      __$$EpisodeImplCopyWithImpl<$Res>;
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
class __$$EpisodeImplCopyWithImpl<$Res>
    extends _$EpisodeCopyWithImpl<$Res, _$EpisodeImpl>
    implements _$$EpisodeImplCopyWith<$Res> {
  __$$EpisodeImplCopyWithImpl(
      _$EpisodeImpl _value, $Res Function(_$EpisodeImpl) _then)
      : super(_value, _then);

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
    return _then(_$EpisodeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      videoPath: null == videoPath
          ? _value.videoPath
          : videoPath // ignore: cast_nullable_to_non_nullable
              as String,
      startOffset: null == startOffset
          ? _value.startOffset
          : startOffset // ignore: cast_nullable_to_non_nullable
              as Duration,
      endOffset: null == endOffset
          ? _value.endOffset
          : endOffset // ignore: cast_nullable_to_non_nullable
              as Duration,
      screenshotPath: null == screenshotPath
          ? _value.screenshotPath
          : screenshotPath // ignore: cast_nullable_to_non_nullable
              as String,
      drawingJson: null == drawingJson
          ? _value.drawingJson
          : drawingJson // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpisodeImpl implements _Episode {
  const _$EpisodeImpl(
      {required this.id,
      required this.videoPath,
      @DurationMsConverter() required this.startOffset,
      @DurationMsConverter() required this.endOffset,
      required this.screenshotPath,
      required this.drawingJson,
      required this.createdAt});

  factory _$EpisodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpisodeImplFromJson(json);

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

  @override
  String toString() {
    return 'Episode(id: $id, videoPath: $videoPath, startOffset: $startOffset, endOffset: $endOffset, screenshotPath: $screenshotPath, drawingJson: $drawingJson, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeImpl &&
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

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EpisodeImplCopyWith<_$EpisodeImpl> get copyWith =>
      __$$EpisodeImplCopyWithImpl<_$EpisodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpisodeImplToJson(
      this,
    );
  }
}

abstract class _Episode implements Episode {
  const factory _Episode(
      {required final String id,
      required final String videoPath,
      @DurationMsConverter() required final Duration startOffset,
      @DurationMsConverter() required final Duration endOffset,
      required final String screenshotPath,
      required final String drawingJson,
      required final DateTime createdAt}) = _$EpisodeImpl;

  factory _Episode.fromJson(Map<String, dynamic> json) = _$EpisodeImpl.fromJson;

  @override
  String get id;
  @override
  String get videoPath;
  @override
  @DurationMsConverter()
  Duration get startOffset;
  @override
  @DurationMsConverter()
  Duration get endOffset;
  @override
  String get screenshotPath;
  @override
  String get drawingJson;
  @override
  DateTime get createdAt;

  /// Create a copy of Episode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EpisodeImplCopyWith<_$EpisodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
