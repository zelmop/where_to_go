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
    var size = MediaQuery.of(context).size;

    return  ViewModelBuilder<FriendsViewViewModel>.reactive(
      viewModelBuilder: () => FriendsViewViewModel(),
      builder: (contex, viewModel, child) => 
      Stack(
        children: [
          Container(
            color: ColorConstants.primaryGrey,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Column(
              children: [
                Header(
                  color: ColorConstants.primaryColor, 
                  fontStyle: FontStyle.normal, 
                  fontWeight: FontWeight.w700, 
                  text: 'Amigos y Amigas', 
                  width: size.width
                ),
                GapsContants.extraLargeVerticalGap,
                widget.friends.isNotEmpty ? Expanded(
                  flex: 1,
                  child: ListView.separated(
                    itemCount: widget.friends.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: size.width * .8,
                        child: FriendListTile(
                          friend: widget.friends[index],
                          onRemove: () => viewModel.onRemoveFriend(index),
                          onEditAvatar: () async => await viewModel.onEditAvatar(
                            widget.friends[index]
                          )
                        )
                      );
                    }, 
                    separatorBuilder: (context, index) => GapsContants.mediumVerticalGap
                  )
                ) :
                const Expanded(
                  flex: 1,
                  child: NoItems(text: 'Aun no se agregaron amigos o amigas')
                )
              ]
            )
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.only(top: 20, right: 20),
              width: 42,
              height: 42,
              child: FloatingActionButton(
                backgroundColor: ColorConstants.primaryColor,
                onPressed: () async => await viewModel.onAddFriend(),
                child: const Icon(
                  Icons.add_outlined,
                  size: 12
                )
              )
            )
          )
        ]
      )
    );
  }
}