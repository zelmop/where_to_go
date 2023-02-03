import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_components/ui_components.dart';
import 'package:where_to_go/viewmodels/viewmodels.dart';

class PaymentView extends StatefulWidget {
  final List<Friend> friends;
  
  const PaymentView({
    super.key,
    required this.friends
  });

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ViewModelBuilder<PaymentViewViewModel>.reactive(
      viewModelBuilder: () => PaymentViewViewModel(), 
      builder: (context, viewModel, child) => Container(
        color: ColorConstants.primaryGrey,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            Header(
              color: ColorConstants.primaryColor, 
              fontStyle: FontStyle.normal, 
              fontWeight: FontWeight.w700, 
              text: '¿A donde vamos?', 
              width: size.width
            ),
            GapsContants.extraLargeVerticalGap,
            Expanded(
              flex: 1,
              child: ListView.separated(
                itemCount: widget.friends.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: size.width * .8,
                    child: FriendListTile(
                      friend: widget.friends[index],
                      onRemove: () => {},
                      onEditAvatar: () => {}
                    )
                  );
                }, 
                separatorBuilder: (context, index) => GapsContants.mediumVerticalGap
              )
            )
          ]
        )
      )
    );
  }
}