import 'package:json_annotation/json_annotation.dart';

part 'places_apli_client_query_parameters.model.g.dart';

@JsonSerializable()
class PlacesApiClientQueryParameters {
  final String query;
  final double lat;
  final double lng;
  final int radius;
  final String region;
  final String type;
  final String key;

  PlacesApiClientQueryParameters({
    required this.query,
    required this.lat,
    required this.lng,
    required this.radius,
    required this.region,
    required this.type,
    required this.key
  });

  factory PlacesApiClientQueryParameters.fromJson(Map<String, dynamic> json) => _$PlacesApiClientQueryParametersFromJson(json);

  Map<String, dynamic> toJson() => _$PlacesApiClientQueryParametersToJson(this);
}