// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpisodeImpl _$$EpisodeImplFromJson(Map<String, dynamic> json) =>
    _$EpisodeImpl(
      id: json['id'] as String,
      videoPath: json['videoPath'] as String,
      startOffset: const DurationMsConverter()
          .fromJson((json['startOffset'] as num).toInt()),
      endOffset: const DurationMsConverter()
          .fromJson((json['endOffset'] as num).toInt()),
      screenshotPath: json['screenshotPath'] as String,
      drawingJson: json['drawingJson'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$EpisodeImplToJson(_$EpisodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'videoPath': instance.videoPath,
      'startOffset': const DurationMsConverter().toJson(instance.startOffset),
      'endOffset': const DurationMsConverter().toJson(instance.endOffset),
      'screenshotPath': instance.screenshotPath,
      'drawingJson': instance.drawingJson,
      'createdAt': instance.createdAt.toIso8601String(),
    };
