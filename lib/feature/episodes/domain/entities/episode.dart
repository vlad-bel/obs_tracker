import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:obs_tracker/core/json/duration_ms_converter.dart';

part 'episode.freezed.dart';

part 'episode.g.dart';

@freezed
abstract class Episode with _$Episode {
  const factory Episode({
    required String id,
    required String videoPath,
    @DurationMsConverter() required Duration startOffset,
    @DurationMsConverter() required Duration endOffset,
    required String screenshotPath,
    required String drawingJson,
    required DateTime createdAt,
  }) = _Episode;

  factory Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);
}
