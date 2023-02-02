import 'package:json_annotation/json_annotation.dart';

part 'place_location.model.g.dart';

@JsonSerializable()
class PlaceLocation {
  final double lat;
  final double lng;

  PlaceLocation({
    required this.lat,
    required this.lng
  });

  factory PlaceLocation.fromJson(Map<String, dynamic> json) => _$PlaceLocationFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceLocationToJson(this);
}