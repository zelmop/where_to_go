import 'package:stacked/stacked.dart';

class PaymentViewViewModel extends BaseViewModel {
  double _total = 0.0;
  double get total => _total;

  void updateTotal(double total) {
    _total = total;
    notifyListeners();
  }
}