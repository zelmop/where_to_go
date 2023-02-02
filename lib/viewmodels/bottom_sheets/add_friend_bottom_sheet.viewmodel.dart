import 'package:data/data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:where_to_go/app/app.locator.dart';

class AddFriendBottomSheetViewModel extends BaseViewModel {
  late DialogService _dialogService;

  late LatLng? _latLng;

  AddFriendBottomSheetViewModel() {
    _dialogService = locator<DialogService>();
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

}