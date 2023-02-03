import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class FriendListTile extends StatelessWidget {
  final Friend friend;
  final VoidCallback onRemove;
  final VoidCallback onEditAvatar;

  const FriendListTile({
    super.key,
    required this.friend,
    required this.onRemove,
    required this.onEditAvatar
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: onEditAvatar,
                child: CircleAvatar(
                  backgroundImage: AssetImage(friend.avatar),
                ),
              )
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
            Icon(
              friend.lat != null ? Icons.location_on_outlined : Icons.location_off_outlined
            ),
            IconButton(
              onPressed: onRemove,
              icon: const Icon(Icons.person_remove_outlined)
            )
          ]
        )
      )
    );
  }
}