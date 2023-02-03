import 'package:stacked/stacked.dart';

class HomeViewViewModel extends BaseViewModel {
  bool _showMenu = true;
  bool get showMenu => _showMenu;

  void toggleMenu() {
    _showMenu = !showMenu;
    notifyListeners();
  }
}