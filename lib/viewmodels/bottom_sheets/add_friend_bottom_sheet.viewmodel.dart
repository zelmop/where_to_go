import 'package:data/data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mixin_services/mixin_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:where_to_go/app/app.locator.dart';

class AddFriendBottomSheetViewModel extends BaseViewModel {
  late DialogService _dialogService;
  late FriendsMixinService _friendsMixinService;
  late BottomSheetService _bottomSheetService;

  LatLng? _latLng;

  AddFriendBottomSheetViewModel() {
    _dialogService = locator<DialogService>();
    _friendsMixinService = locator<FriendsMixinService>();
    _bottomSheetService = locator<BottomSheetService>();
  }

  final List<String> preferences = [];

  void onAddPreference(String? preference) {
    if (preference != null && preference.isNotEmpty) {
      preferences.add(preference);
    }
  }

  Future<void> onGetLocation() async {
    var response = await _dialogService.showCustomDialog(variant: DialogType.map);
    if (response != null && response.confirmed) {
      _latLng = response.data;
    } else {
      _latLng = null;
    }
  }

  void onAddFriend({required String name, required String nick}) {
    double? lat;

    if (_latLng != null) {
      lat = _latLng?.latitude;
    } else {
      lat = null;
    }

    double? lng;

    if (_latLng != null) {
      lng = _latLng?.longitude;
    } else {
      lng = null;
    }

    var friend = Friend(
      name: name, 
      nick: nick,
      lat: lat,
      lng: lng,
      preferences: preferences,
      avatar: ''
    );

    _friendsMixinService.addFriend(friend);

    var response = SheetResponse(confirmed: true);
    _bottomSheetService.completeSheet(response);
  }

}