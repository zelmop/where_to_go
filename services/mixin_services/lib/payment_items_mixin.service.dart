import 'package:data/data.dart';
import 'package:stacked/stacked.dart';

class PaymentItemsMixinService with ListenableServiceMixin {
  final List<PaymentItem> _items = [];
  List<PaymentItem> get items => _items;

  void addItem(PaymentItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}