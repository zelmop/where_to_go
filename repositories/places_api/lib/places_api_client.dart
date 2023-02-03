import 'package:dio/dio.dart';

import 'package:data/data.dart';

class PlacesApiClient {
  final baseUrl = 'https://maps.googleapis.com/maps/api/place/textsearch/json';

  final dio = Dio();

  Future<List<Place>> fetchPlacesByTextSearch(Map<String, dynamic> queryParameters) async {
    try {
      var response = await dio.get(baseUrl, queryParameters: queryParameters);
      
      if (response.statusCode == 200) {
        if (response.data != null && response.data!['results'] != null) {
          List<Place> result = [];

          for (var p in response.data!['results']) {
            result.add(Place.fromJson(p));
          }

          return result;
        } else {
          return [];
        }
      } else {
        return [];
      }
    } on Exception catch (_) {
      return [];
    }
  }
}