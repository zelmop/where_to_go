import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ui_components/ui_components.dart';
import 'package:where_to_go/viewmodels/viewmodels.dart';

class MapDialog extends StatefulWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  
  const MapDialog({
    super.key,
    required this.request,
    required this.completer
  });

  @override
  State<MapDialog> createState() => _MapDialogState();
}

class _MapDialogState extends State<MapDialog> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ViewModelBuilder<MapDialogViewModel>.reactive(
      viewModelBuilder: () => MapDialogViewModel(),
      onViewModelReady: (viewModel) async { 
        await viewModel.initialize();
        GoogleMapController controller = await _controller.future;
        await controller.animateCamera(
          CameraUpdate.newCameraPosition(viewModel.cameraPosition)
        );
      },
      builder: (context, viewModel, child) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        insetPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: SizedBox(
          width: size.width *.9, 
          height: size.height * .6,
          child: viewModel.isBusy ? 
          SimpleLoader(width: size.width *.9, height: size.height * .6):
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                viewModel.showMap ? GoogleMap(
                  markers: viewModel.markers,
                  mapType: MapType.hybrid,
                  initialCameraPosition: viewModel.cameraPosition,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  }
                ) : Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: const Center(
                    child: Text(
                      'Opps! Ocurrio un error. Comproba tus permisos de geolocalización.',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 16
                      ),
                      textAlign: TextAlign.center
                    )
                  )
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    margin: const EdgeInsets.only(top: 20, right: 20),
                    child: IconButton(
                      color: Colors.black,
                      icon: const Icon(Icons.close_outlined), 
                      onPressed: () => viewModel.onCompleteDialogUnconfirmed()
                    )
                  )
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: LargeButton(
                      color: ColorConstants.primaryColor, 
                      onPressed: () => viewModel.onCompleteDialog(), 
                      text: viewModel.showMap ? 'CONFIRMAR' : 'REINTENTAR', 
                      width: size.width * .5
                    )
                  )
                )
              ]
            )
          )
        ) 
      )
    );
  }
}