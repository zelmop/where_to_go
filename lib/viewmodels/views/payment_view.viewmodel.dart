import 'package:data/data.dart';
import 'package:mixin_services/mixin_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:where_to_go/app/app.locator.dart';

class PaymentViewViewModel extends BaseViewModel {
  late PaymentItemsMixinService _paymentItemsMixinService;
  late DialogService _dialogService;

  double _total = 0.0;
  double get total => _total;

  PaymentViewViewModel() {
    _paymentItemsMixinService = locator<PaymentItemsMixinService>();
    _dialogService = locator<DialogService>();
  }

  void updateTotal(double total) {
    _total = total;
    notifyListeners();
  }

  void onRemoveItem(int index) {
    _paymentItemsMixinService.removeItem(index);
  }

  Future<void> onAddPaymentItem(String friendId) async {
    await _dialogService.showCustomDialog(variant: DialogType.addPaymentItem, data: friendId);
  }
}