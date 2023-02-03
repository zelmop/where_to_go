import 'package:data/data.dart';
import 'package:stacked/stacked.dart';
import 'package:where_to_go/utils/utils.dart';

class SearchViewFiltersWidgetViewModel extends BaseViewModel {

  List<Friend> _friends = [];
  List<Friend> get friends => _friends;

  List<String> _preferences = [];
  List<String> get preferences => _preferences;

  void initialize(List<Friend> friends) {
    _friends = friends;
    _setPreferences();
    notifyListeners();
  }

  void _setPreferences() {
    _preferences = SearchUtil.getPreferencesForListOfFriends(_friends);
  }

  void onDeletePreference(String preference) {
    _preferences.remove(preference);
    notifyListeners();
  }
}