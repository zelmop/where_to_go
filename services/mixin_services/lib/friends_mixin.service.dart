import 'package:data/data.dart';
import 'package:stacked/stacked.dart';

class FriendsMixinService with ListenableServiceMixin {
  final List<Friend> _friends = [];
  List<Friend> get friends => _friends;

  void addFriend(Friend friend) {
    _friends.add(friend);
    notifyListeners();
  }

  void removeFriend(int index) {
    _friends.removeAt(index);
    notifyListeners();
  }

  void editFriendAvatar(Friend friend, String newAvatar) {
    var idx = _friends.indexOf(friend);
    _friends.removeAt(idx);
    friend.avatar = newAvatar;
    _friends.add(friend);
    notifyListeners();
  }
}