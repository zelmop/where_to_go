import 'package:dio/dio.dart';

import 'package:data/data.dart';

class PlacesApiClient {
  final baseUrl = 'https://maps.googleapis.com/maps/api/place/textsearch/json';

  final dio = Dio();

  Future<List<Place>> fetchPlacesByTextSearch(Map<String, dynamic> queryParameters) async {
    var response = await dio.get<List<Place>>(baseUrl, queryParameters: queryParameters);

    if (response.statusCode == 200) {
      if (response.data != null) {
        return response.data!;
      } else {
        return [];
      }
    } else {
      return [];
    }
  }
}