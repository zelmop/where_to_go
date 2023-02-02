import 'package:stacked/stacked.dart';

class AddFriendBottomSheetViewModel extends BaseViewModel {

  final List<String> preferences = [];

  void onAddPreference(String? preference) {
    if (preference != null && preference.isNotEmpty) {
      preferences.add(preference);
    }
  }

}