import 'dart:async';

import 'package:data/data.dart';
import 'package:mixin_services/mixin_services.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:where_to_go/app/app.locator.dart';

class FriendsViewViewModel extends BaseViewModel {
  late BottomSheetService _bottomSheetService;
  late DialogService _dialogService;
  late FriendsMixinService _friendsMixinService;

  FriendsViewViewModel() {
    _bottomSheetService = locator<BottomSheetService>();
    _dialogService = locator<DialogService>();
    _friendsMixinService = locator<FriendsMixinService>();
  }

  Future<void> onAddFriend() async {
    await _bottomSheetService.showCustomSheet(variant: BottomSheetType.newFriend);
  }

  void onRemoveFriend(int index) {
    _friendsMixinService.removeFriend(index);
  }

  Future<void> onEditAvatar(Friend friend) async {
    await _dialogService.showCustomDialog(variant: DialogType.avatars, data: friend);
  }
}