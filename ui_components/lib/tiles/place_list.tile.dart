import 'package:data/data.dart';
import 'package:flutter/material.dart';

class PlaceListTile extends StatelessWidget {
  final Place place;

  const PlaceListTile({
    super.key,
    required this.place
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
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: const TextStyle(
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 16
                    )
                  ),
                  Text(
                    place.formattedAddress,
                    style: const TextStyle(
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 12
                    )
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}