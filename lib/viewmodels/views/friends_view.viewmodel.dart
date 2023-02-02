import 'dart:async';

import 'package:data/data.dart';
import 'package:mixin_services/mixin_services.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:where_to_go/app/app.locator.dart';

class FriendsViewViewModel extends BaseViewModel {
  late BottomSheetService _bottomSheetService;
  late FriendsMixinService _friendsMixinService;

  FriendsViewViewModel() {
    _bottomSheetService = locator<BottomSheetService>();
    _friendsMixinService = locator<FriendsMixinService>();
  }

  Future<void> onAddFriend() async {
    await _bottomSheetService.showCustomSheet(variant: BottomSheetType.newFriend);
  }

  void onRemoveFriend(int index) {
    _friendsMixinService.removeFriend(index);
  }
}