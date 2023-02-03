import 'package:data/data.dart';
import 'package:mixin_services/mixin_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:where_to_go/app/app.locator.dart';

class AddPaymentItemDailogViewModel extends BaseViewModel {
  late PaymentItemsMixinService _paymentItemsMixinService;
  late DialogService _dialogService;

  String _friendId = '';

  AddPaymentItemDailogViewModel(String friendId) {
    _paymentItemsMixinService = locator<PaymentItemsMixinService>();
    _dialogService = locator<DialogService>();

    _friendId = friendId;
  }

  void onAddPaymentItem(String name, String price) {
    var paymentItem = PaymentItem(
      friendId: _friendId,
      name: name,
      price: double.parse(price)
    );

    _paymentItemsMixinService.addItem(paymentItem);

    var dialogResponse = DialogResponse(confirmed: true, data: null);
    _dialogService.completeDialog(dialogResponse);
  }

  void onCompleteDialogUnconfirmed() {
    var dialogResponse = DialogResponse(confirmed: false, data: null);
    _dialogService.completeDialog(dialogResponse);
  }
}