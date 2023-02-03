import 'package:data/data.dart';
import 'package:mixin_services/mixin_services.dart';
import 'package:stacked/stacked.dart';
import 'package:where_to_go/app/app.locator.dart';

class MainNavigationViewViewModel extends ReactiveViewModel {
  final _friendsMixinService = locator<FriendsMixinService>();
  final _paymentItemsMixinService = locator<PaymentItemsMixinService>();
  
  List<Friend> get friends => _friendsMixinService.friends;
  List<PaymentItem> get paymentItems => _paymentItemsMixinService.items;

  @override
  List<ListenableServiceMixin> get listenableServices => [_friendsMixinService, _paymentItemsMixinService];
}