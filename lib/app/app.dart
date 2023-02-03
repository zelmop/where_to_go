import 'package:mixin_services/mixin_services.dart';

import 'package:places_service/places_service_client.dart';

import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:where_to_go/views/views.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: InitialView, initial: true),
    MaterialRoute(page: HomeView)
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: FriendsMixinService),
    LazySingleton(classType: PaymentItemsMixinService),
    LazySingleton(classType: PlacesServiceClient),
    LazySingleton(classType: NavigationService)
  ]
)
class App {}