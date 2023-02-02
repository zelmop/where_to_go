import 'package:data/data.dart';
import 'package:places_api/places_api_client.dart';

class PlacesServiceClient {
  final PlacesApiClient apiClient = PlacesApiClient();

  Future<List<Place>> fetchPlacesByTextSearch(Map<String, dynamic> queryParameters) async {
    return await apiClient.fetchPlacesByTextSearch(queryParameters);
  }
}