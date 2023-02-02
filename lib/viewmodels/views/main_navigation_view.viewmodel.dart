import 'package:data/data.dart';
import 'package:mixin_services/mixin_services.dart';
import 'package:stacked/stacked.dart';
import 'package:where_to_go/app/app.locator.dart';

class MainNavigationViewViewModel extends ReactiveViewModel {
  final _friendsMixinService = locator<FriendsMixinService>();
  
  List<Friend> get friends => _friendsMixinService.friends;

  @override
  List<ListenableServiceMixin> get listenableServices => [_friendsMixinService];
}