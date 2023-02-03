import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_components/ui_components.dart';
import 'package:where_to_go/viewmodels/viewmodels.dart';

class PaymentView extends StatefulWidget {
  final List<Friend> friends;
  final List<PaymentItem> paymentItems;
  
  const PaymentView({
    super.key,
    required this.friends,
    required this.paymentItems
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
              text: '¿Cómo pagamos?', 
              width: size.width
            ),
            GapsContants.extraLargeVerticalGap,
            widget.friends.isNotEmpty ? Expanded(
              child: ListView.separated(
                itemCount: widget.friends.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: size.width * .8,
                    child: FriendPaymentListTile(
                      friend: widget.friends[index],
                      onTap: () async => await viewModel.onAddPaymentItem(
                        widget.friends[index].id
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
            ),
            GapsContants.mediumVerticalGap,
            Header(
              color: ColorConstants.primaryColor, 
              fontStyle: FontStyle.normal, 
              fontWeight: FontWeight.w700, 
              text: 'Items', 
              width: size.width
            ),
            GapsContants.mediumVerticalGap,
            widget.paymentItems.isNotEmpty ? 
            Expanded(
              flex: 1,
              child: ListView.separated(
                itemBuilder: (context, index) => PaymentListTile(
                  item: widget.paymentItems[index],
                  onTap: () => viewModel.onRemoveItem(index),
                ), 
                separatorBuilder: (context, index) => const SizedBox(height: 10), 
                itemCount: widget.paymentItems.length
              )
            ) : 
            const Expanded(
              flex: 1,
              child: NoItems(text: 'Aun no se agregaron items')
            ),
            GapsContants.mediumVerticalGap,
            PaymentDetails(friends: widget.friends, paymentItems: widget.paymentItems)
          ]
        )
      )
    );
  }
}