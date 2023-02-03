import 'package:data/data.dart';

class SearchUtil {

  static List<String> getPreferencesForListOfFriends(List<Friend> friends) {
    var friendsWithPreferences = friends.where((f) => f.preferences.isNotEmpty).toList();

    if (friendsWithPreferences.isNotEmpty) {
      var temp = friendsWithPreferences.map((e) => e.preferences.map((p) => p)).toList();
      return temp.expand((element) => element).toList();
    }

    return [];
  }

}