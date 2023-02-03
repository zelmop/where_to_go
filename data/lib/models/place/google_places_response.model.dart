import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'google_places_response.model.g.dart';

@JsonSerializable()
class GooglePlacesResponse {
  @JsonKey(name: 'next_page_token')
  final String? nextPageToken;

  final List<Place>? results;

  final String? status;

  GooglePlacesResponse({
    required this.nextPageToken,
    required this.results,
    required this.status
  });

  factory GooglePlacesResponse.fromJson(Map<String, dynamic> json) => _$GooglePlacesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GooglePlacesResponseToJson(this);
}