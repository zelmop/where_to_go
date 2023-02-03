import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';

import 'package:location/location.dart';

class GeolocationUtil {
  static LatLng getCentralGeoCoordinate(List<LatLng> geoCoordinates) {
    
    if (geoCoordinates.length == 1) {
      return geoCoordinates.first;
    }

    double x = 0;
    double y = 0;
    double z = 0;

    for (var geoCoordinate in geoCoordinates) {
      var latitude = geoCoordinate.latitude * pi / 180;
      var longitude = geoCoordinate.longitude * pi / 180;

      x += cos(latitude) * cos(longitude);
      y += cos(latitude) * sin(longitude);
      z += sin(latitude);
    }

    var total = geoCoordinates.length;

    x = x / total;
    y = y / total;
    z = z / total;

    var centralLongitude = atan2(y, x);
    var centralSquareRoot = sqrt(x * x + y * y);
    var centralLatitude = atan2(z, centralSquareRoot);

    return LatLng(centralLatitude * 180 / pi, centralLongitude * 180 / pi);
  }

  static Future<LatLng?> fetchUserLocation() async {
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
}