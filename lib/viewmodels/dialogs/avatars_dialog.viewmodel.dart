import 'package:data/data.dart';
import 'package:mixin_services/mixin_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:where_to_go/app/app.locator.dart';

class AvatarsDialogViewModel extends BaseViewModel {
  late DialogService _dialogService;
  late FriendsMixinService _friendsMixinService;
  
  List<String> avatars = [
    'assets/images/avatar_00.png',
    'assets/images/avatar_01.png',
    'assets/images/avatar_02.png',
    'assets/images/avatar_03.png',
    'assets/images/avatar_04.png',
    'assets/images/avatar_05.png',
    'assets/images/avatar_07.png',
    'assets/images/avatar_08.png'
  ];

  AvatarsDialogViewModel() {
    _dialogService = locator<DialogService>();
    _friendsMixinService = locator<FriendsMixinService>();
  }

  void onEditFriendAvatar(Friend friend, String newAvatar) {
    _friendsMixinService.editFriendAvatar(friend, newAvatar);
    var response = DialogResponse(confirmed: true);
    _dialogService.completeDialog(response);
  }
}