// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Place _$PlaceFromJson(Map<String, dynamic> json) => Place(
      businessStatus: json['business_status'] as String,
      formattedAddress: json['formatted_address'] as String,
      geometry:
          PlaceGeometry.fromJson(json['geometry'] as Map<String, dynamic>),
      name: json['name'] as String,
      openingHours: json['opening_hours'] as String,
      placeId: json['place_id'] as String,
      rating: (json['rating'] as num).toDouble(),
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      userRatingsTotal: json['user_ratings_total'] as String,
    );

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'business_status': instance.businessStatus,
      'formatted_address': instance.formattedAddress,
      'geometry': instance.geometry,
      'name': instance.name,
      'opening_hours': instance.openingHours,
      'place_id': instance.placeId,
      'rating': instance.rating,
      'types': instance.types,
      'user_ratings_total': instance.userRatingsTotal,
    };
