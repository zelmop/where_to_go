import 'package:stacked/stacked.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:where_to_go/app/app.locator.dart';

class MapDialogViewModel extends BaseViewModel {
  late DialogService _dialogService;

  late CameraPosition _cameraPosition;
  CameraPosition get cameraPosition => _cameraPosition;

  final Set<Marker> markers = {};

  LatLng _latLng = const LatLng(0, 0);

  bool _showMap = true;
  bool get showMap => _showMap;

  MapDialogViewModel() {
    _dialogService = locator<DialogService>();
  }

  Future<void> initialize() async {
    setBusy(true);
    await _fetchUserLocation();
    setBusy(false);
  }

  Future<void> onCompleteDialog() async {
    if (_showMap) {
      var dialogResponse = DialogResponse(confirmed: true, data: _latLng);
      _dialogService.completeDialog(dialogResponse);
    } else {
      setBusy(true);
      await _fetchUserLocation();
      setBusy(false);
    }
  }

  void onCompleteDialogUnconfirmed() {
    var dialogResponse = DialogResponse(confirmed: false, data: null);
    _dialogService.completeDialog(dialogResponse);
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
        _showMap = false;
        notifyListeners();
        return;
      }
    }

    permissionGranted = await location.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();

      if (permissionGranted != PermissionStatus.granted) {
        _showMap = false;
        notifyListeners();
        return;
      }
    }

    locationData = await location.getLocation();

    _latLng = LatLng(locationData.latitude!, locationData.longitude!);

    _cameraPosition = CameraPosition(
      target: _latLng,
      zoom: 20
    );

    markers.add(
      Marker(
        markerId: const MarkerId('a'),
        draggable: true,
        position: _latLng,
        infoWindow: const InfoWindow(
          title: 'My Custom Title ',
          snippet: 'My Custom Subtitle'
        ),
        icon: BitmapDescriptor.defaultMarker,
        onDragEnd: (value) {
          _latLng = LatLng(value.latitude, value.longitude);
        }
      )
    );

    notifyListeners();
  }
}