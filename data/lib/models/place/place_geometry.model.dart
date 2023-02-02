import 'package:json_annotation/json_annotation.dart';

import 'place.dart';

part 'place_geometry.model.g.dart';

@JsonSerializable()
class PlaceGeometry {
  final PlaceLocation location;

  PlaceGeometry({
    required this.location
  });

  factory PlaceGeometry.fromJson(Map<String, dynamic> json) => _$PlaceGeometryFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceGeometryToJson(this);
}