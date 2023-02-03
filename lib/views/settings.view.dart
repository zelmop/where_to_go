import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_components/ui_components.dart';
import 'package:where_to_go/viewmodels/viewmodels.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ViewModelBuilder<SettingsViewViewModel>.reactive(
      viewModelBuilder: () => SettingsViewViewModel(), 
      builder: (context, viewModel, child) => Container(
        color: ColorConstants.primaryGrey,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            Header(
              color: ColorConstants.primaryColor, 
              fontStyle: FontStyle.normal, 
              fontWeight: FontWeight.w700, 
              text: 'Configuración', 
              width: size.width
            ),
            GapsContants.extraLargeVerticalGap,
            LargeButton(
              color: ColorConstants.primaryColor, 
              onPressed: () async => await viewModel.onLogOut(), 
              text: 'SALIR', 
              width: size.width * .7
            )
          ]
        )
      )
    );
  }
}