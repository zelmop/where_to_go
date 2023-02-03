import 'package:data/data.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:places_service/places_service_client.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:where_to_go/app/app.locator.dart';
import 'package:where_to_go/utils/utils.dart';

class SearchViewViewModel extends BaseViewModel {
  late PlacesServiceClient _placesServiceClient;
  late DialogService _dialogService;

  List<Place> _places = [];
  List<Place> get places => _places;

  LatLng? _latLng;

  SearchViewViewModel() {
    _placesServiceClient = locator<PlacesServiceClient>();
    _dialogService = locator<DialogService>();
  }

  Future<void> onSearch({
    required List<Friend> friends,
    required String query
  }) async {
    setBusy(true);

    if (friends.isNotEmpty) {

      var friendsWithPreferences = friends.where((f) => f.preferences.isNotEmpty).toList();

      if (friendsWithPreferences.isNotEmpty) {
        var temp = friendsWithPreferences.map((e) => e.preferences.map((p) => p)).toList();
        var preferences = temp.expand((element) => element).toList();

        query += ' ${preferences.join(" ")}';
      }
      
      var friendsWithLocation = friends.where((f) => f.lat != null).toList();

      if (friendsWithLocation.isNotEmpty) {
        var geoCoordinates = friendsWithLocation.map((f) => LatLng(f.lat!, f.lng!)).toList();

        _latLng = GeolocationUtil.getCentralGeoCoordinate(geoCoordinates);
      }

    } else {
      _latLng = await _fetchUserLocation();
    }

    if (_latLng == null) {
      setBusy(false);

      await _dialogService.showDialog(
        title: 'Opps!', 
        description: 'Al menos un amigo o amiga debe tener agregada su localización. Alternativamente debes aceptar los permisos, para usar tu posición actual.'
      );

      return;
    }

    if (query.isEmpty) {
      setBusy(false);
      
      await _dialogService.showDialog(
        title: 'Opps!', 
        description: 'Al menos un amigo o amiga debe tener preferencias. Alternativamente ingresa algo de tu interes.'
      );

      return;
    }

    var parameters = PlacesApiClientQueryParameters(
      query: query,
      location: '${_latLng!.latitude},${_latLng!.longitude}',
      radius: 5000,
      region: 'ar',
      type: '',
      key: dotenv.get('GOOGLE_API_KEY')
    );

    var queryParameters = parameters.toJson();

    _places = await _placesServiceClient.fetchPlacesByTextSearch(queryParameters);
    notifyListeners();

    setBusy(false);
  }

  Future<LatLng?> _fetchUserLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();

    if (!serviceEnabled) {

      serviceEnabled = await location.requestService();

      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await location.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();

      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    locationData = await location.getLocation();

    return LatLng(locationData.latitude!, locationData.longitude!);
  }

  Future<void> onOpenPlaceInMap(String placeId) async {
    String googleMapUrl = 'https://www.google.com/maps/place/?q=place_id:$placeId';
    var url = Uri.parse(googleMapUrl);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      await _dialogService.showDialog(
        title: 'Opps!', 
        description: 'Ocurrio un error al intentar abrir el mapa.'
      );
    }
  }
}