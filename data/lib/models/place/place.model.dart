import 'package:json_annotation/json_annotation.dart';

import 'place.dart';

part 'place.model.g.dart';

@JsonSerializable()
class Place {

  @JsonKey(name: 'business_status')
  final String businessStatus;

  @JsonKey(name: 'formatted_address')
  final String formattedAddress;

  final PlaceGeometry geometry;

  final String name;

  @JsonKey(name: 'opening_hours')
  final String openingHours;

  @JsonKey(name: 'place_id')
  final String placeId;

  final double rating;

  final List<String> types;

  @JsonKey(name: 'user_ratings_total')
  final String userRatingsTotal;

  Place({
    required this.businessStatus,
    required this.formattedAddress,
    required this.geometry,
    required this.name,
    required this.openingHours,
    required this.placeId,
    required this.rating,
    required this.types,
    required this.userRatingsTotal
  });

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}