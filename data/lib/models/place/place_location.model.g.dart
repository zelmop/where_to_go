// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_location.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceLocation _$PlaceLocationFromJson(Map<String, dynamic> json) =>
    PlaceLocation(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$PlaceLocationToJson(PlaceLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
