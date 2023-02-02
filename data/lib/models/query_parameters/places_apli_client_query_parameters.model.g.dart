// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_apli_client_query_parameters.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesApiClientQueryParameters _$PlacesApiClientQueryParametersFromJson(
        Map<String, dynamic> json) =>
    PlacesApiClientQueryParameters(
      query: json['query'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      radius: json['radius'] as int,
      region: json['region'] as String,
      type: json['type'] as String,
      key: json['key'] as String,
    );

Map<String, dynamic> _$PlacesApiClientQueryParametersToJson(
        PlacesApiClientQueryParameters instance) =>
    <String, dynamic>{
      'query': instance.query,
      'lat': instance.lat,
      'lng': instance.lng,
      'radius': instance.radius,
      'region': instance.region,
      'type': instance.type,
      'key': instance.key,
    };
