import 'package:json_annotation/json_annotation.dart';

import 'place.dart';

part 'place_opening_hours.model.g.dart';

@JsonSerializable()
class PlaceOpeningHours {
  @JsonKey(name: 'open_now')
  final bool openNow;

  final List<PlaceOpeningHoursPeriod>? periods;

  @JsonKey(name: 'weekday_text')
  final List<String>? weekdayText;
  
  PlaceOpeningHours({
    required this.openNow,
    required this.periods,
    required this.weekdayText
  });

  factory PlaceOpeningHours.fromJson(Map<String, dynamic> json) => _$PlaceOpeningHoursFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceOpeningHoursToJson(this);
}