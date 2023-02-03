import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class FriendPaymentListTile extends StatelessWidget {
  final Friend friend;
  final VoidCallback onTap;

  const FriendPaymentListTile({
    super.key,
    required this.friend,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CircleAvatar(backgroundImage: AssetImage(friend.avatar))
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NameTileText(name: friend.name),
                        NickTileText(nick: friend.nick)
                      ]
                    )
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: const Icon(Icons.shopping_cart_outlined)
                  )
                ]
              )
            ]
          )
        )
    );
  }
}