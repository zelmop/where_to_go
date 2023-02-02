import 'package:data/data.dart';
import 'package:flutter/material.dart';
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
  
  @override
  Widget build(BuildContext context) {
    return  ViewModelBuilder<FriendsViewViewModel>.reactive(
      viewModelBuilder: () => FriendsViewViewModel(),
      builder: (contex, viewModel, child) => 
      Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: ListView.separated(
              itemCount: widget.friends.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Text(widget.friends[index].name),
                );
              }, 
              separatorBuilder: (context, index) => GapsContants.mediumVerticalGap
            ),
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
        ]
      )
    );
  }
}