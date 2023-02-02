import 'dart:async';

import 'package:data/data.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:where_to_go/app/app.locator.dart';

class FriendsViewViewModel extends BaseViewModel {
  late BottomSheetService _bottomSheetService;

  FriendsViewViewModel() {
    _bottomSheetService = locator<BottomSheetService>();
  }

  Future<void> onAddFriend() async {
    await _bottomSheetService.showCustomSheet(variant: BottomSheetType.newFriend);
  }
}