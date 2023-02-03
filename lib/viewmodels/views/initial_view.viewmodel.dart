import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:where_to_go/app/app.locator.dart';
import 'package:where_to_go/app/app.router.dart';

class InitialViewViewModel extends BaseViewModel {
  late NavigationService _navigationService;

  InitialViewViewModel() {
    _navigationService = locator<NavigationService>();
  }

  Future<void> onNavigateToHomeView() async {
    await _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }
}