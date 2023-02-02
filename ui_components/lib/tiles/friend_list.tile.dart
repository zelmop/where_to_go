import 'package:data/data.dart';
import 'package:flutter/material.dart';

class FriendListTile extends StatelessWidget {
  final Friend friend;
  final VoidCallback onRemove;

  const FriendListTile({
    super.key,
    required this.friend,
    required this.onRemove
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            const Expanded(
              flex: 2,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar_00.png'),
              )
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    friend.name,
                    style: const TextStyle(
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 16
                    )
                  ),
                  Text(
                    friend.nick,
                    style: const TextStyle(
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 12
                    )
                  )
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