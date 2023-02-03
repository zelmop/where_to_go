import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:where_to_go/app/app.locator.dart';
import 'package:where_to_go/app/app.router.dart';

class SettingsViewViewModel extends BaseViewModel {
  late NavigationService _naviationService;

  SettingsViewViewModel() {
    _naviationService = locator<NavigationService>();
  }

  Future<void> onLogOut() async {
    await _naviationService.pushNamedAndRemoveUntil(Routes.initialView);
  }
}