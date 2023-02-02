import 'package:json_annotation/json_annotation.dart';

part 'place_opening_hours_period.model.g.dart';

@JsonSerializable()
class PlaceOpeningHoursPeriod {
  final int day;
  final String time;

  PlaceOpeningHoursPeriod({
    required this.day,
    required this.time
  });

  factory PlaceOpeningHoursPeriod.fromJson(Map<String, dynamic> json) => _$PlaceOpeningHoursPeriodFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceOpeningHoursPeriodToJson(this);
}