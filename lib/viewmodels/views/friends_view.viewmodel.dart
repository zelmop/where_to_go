import 'dart:async';

import 'package:data/data.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:where_to_go/app/app.locator.dart';

class FriendsViewViewModel extends BaseViewModel {
  late BottomSheetService _bottomSheetService;

  FriendsViewViewModel() {
    _bottomSheetService = locator<BottomSheetService>();
  }

  Future<void> onAddFriend() async {
    await _bottomSheetService.showCustomSheet(variant: BottomSheetType.newFriend);
  }

  /*late CameraPosition _cameraPosition;
  CameraPosition get cameraPosition => _cameraPosition;

  Set<Marker> _markers = {};
  Set<Marker> get markers => _markers;

  Future<void> initialize() async {
    setBusy(true);
    await _fetchUserLocation();
    setBusy(false);
  }

  void onGoogleMapTap(LatLng position) {
    var temp = _markers;
    
    temp.add(
      Marker(
        markerId: const MarkerId('b'),
        draggable: true,
        position: LatLng(position.latitude, position.longitude),
        infoWindow: const InfoWindow(
          title: 'My Custom Title ',
          snippet: 'My Custom Subtitle'
        ),
        icon: BitmapDescriptor.defaultMarker
      )
    );

    _markers = temp;
    notifyListeners();
  }

  Future _fetchUserLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();

    if (!serviceEnabled) {

      serviceEnabled = await location.requestService();

      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();

      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();

    _cameraPosition = CameraPosition(
      target: LatLng(locationData.latitude!, locationData.longitude!),
      zoom: 22
    );

    markers.add(
      Marker(
        markerId: const MarkerId('a'),
        draggable: true,
        position: LatLng(locationData.latitude!, locationData.longitude!),
        infoWindow: const InfoWindow(
          title: 'My Custom Title ',
          snippet: 'My Custom Subtitle'
        ),
        icon: BitmapDescriptor.defaultMarker
      )
    );

    notifyListeners();
  }*/
}