import 'package:data/data.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:where_to_go/app/app.locator.dart';
import 'package:where_to_go/views/views.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.map: (context, dialogRequest, completer) =>
        MapDialog(request: dialogRequest, completer: completer),
    DialogType.avatars: (context, dialogRequest, completer) =>
        AvatarsDialog(request: dialogRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}