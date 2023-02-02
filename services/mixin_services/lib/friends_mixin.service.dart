import 'package:data/data.dart';
import 'package:stacked/stacked.dart';

class FriendsMixinService with ListenableServiceMixin {
  final List<Friend> _friends = [];
  List<Friend> get friends => _friends;

  void addFriend(Friend friend) {
    _friends.add(friend);
    notifyListeners();
  }
}