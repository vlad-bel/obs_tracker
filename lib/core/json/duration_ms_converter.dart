import 'package:json_annotation/json_annotation.dart';
import 'package:obs_tracker/feature/episodes/domain/entities/episode.dart';

class DurationMsConverter implements JsonConverter<Duration, int> {
  const DurationMsConverter();

  @override
  Duration fromJson(int json) {
    return Duration(milliseconds: json);
  }

  @override
  int toJson(Duration object) {
    return object.inMilliseconds;
  }
}
