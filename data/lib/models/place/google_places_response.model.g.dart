// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_places_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GooglePlacesResponse _$GooglePlacesResponseFromJson(
        Map<String, dynamic> json) =>
    GooglePlacesResponse(
      nextPageToken: json['next_page_token'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Place.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$GooglePlacesResponseToJson(
        GooglePlacesResponse instance) =>
    <String, dynamic>{
      'next_page_token': instance.nextPageToken,
      'results': instance.results,
      'status': instance.status,
    };
