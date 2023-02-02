//import 'dart:async';

import 'package:data/data.dart';
import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_components/ui_components.dart';
import 'package:where_to_go/viewmodels/viewmodels.dart';

class FriendsView extends StatefulWidget {
  final List<Friend> friends;

  const FriendsView({
    super.key,
    required this.friends
  });

  @override
  State<FriendsView> createState() => _FriendsViewState();
}

class _FriendsViewState extends State<FriendsView> {
  //final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  
  @override
  Widget build(BuildContext context) {
    return  ViewModelBuilder<FriendsViewViewModel>.reactive(
      viewModelBuilder: () => FriendsViewViewModel(),
      onViewModelReady: (viewModel) async { 
        /*await viewModel.initialize();
        GoogleMapController controller = await _controller.future;
        await controller.animateCamera(
          CameraUpdate.newCameraPosition(viewModel.cameraPosition)
        );*/
      },
      builder: (contex, viewModel, child) => Stack(
        children: [
          ListView.separated(
            itemCount: widget.friends.length,
            itemBuilder: (context, index) {
              return Container();
            }, 
            separatorBuilder: (context, index) => GapsContants.mediumVerticalGap
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.only(top: 20, right: 20),
              child: FloatingActionButton(
                backgroundColor: ColorConstants.secondaryColor,
                onPressed: () async => await viewModel.onAddFriend(),
                child: const Icon(
                  Icons.add_outlined
                )
              )
            )
          )
          /*viewModel.isBusy ? 
          Container() :
          GoogleMap(
            markers: viewModel.markers,
            mapType: MapType.hybrid,
            initialCameraPosition: viewModel.cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap: (position) => viewModel.onGoogleMapTap(position)
          )*/
        ]
      )
    );
  }
}