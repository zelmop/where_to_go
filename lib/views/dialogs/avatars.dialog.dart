import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ui_components/ui_components.dart';
import 'package:where_to_go/viewmodels/viewmodels.dart';

class AvatarsDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  
  const AvatarsDialog({
    super.key,
    required this.request,
    required this.completer
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ViewModelBuilder<AvatarsDialogViewModel>.reactive(
      viewModelBuilder: () => AvatarsDialogViewModel(), 
      builder: (context, viewModel, child) => Dialog(
        insetPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Header(
                color: ColorConstants.primaryColor, 
                fontStyle: FontStyle.normal, 
                fontWeight: FontWeight.w700, 
                text: 'Selecciona tu avatar', 
                width: size.width
              ),
              GapsContants.extraLargeVerticalGap,
              Expanded(
                child: GridView.builder(
                  itemCount: viewModel.avatars.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => viewModel.onEditFriendAvatar(request.data, viewModel.avatars[index]),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: request.data.avatar == viewModel.avatars[index] ? 
                        ColorConstants.primaryColor : ColorConstants.secondaryColor,
                        shape: BoxShape.circle
                      ),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                          viewModel.avatars[index]
                        )
                      )
                    )
                  )
                )
              )
            ]
          ),
        )
      )
    );
  }
}