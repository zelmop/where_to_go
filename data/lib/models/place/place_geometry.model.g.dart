// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_geometry.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceGeometry _$PlaceGeometryFromJson(Map<String, dynamic> json) =>
    PlaceGeometry(
      location:
          PlaceLocation.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceGeometryToJson(PlaceGeometry instance) =>
    <String, dynamic>{
      'location': instance.location,
    };
