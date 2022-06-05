import 'package:flutter/material.dart';
import 'package:ienergy_app/utils/colors.dart';

class SaleCard extends StatelessWidget {
  final snap;
  const SaleCard({Key? key, this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: secondaryGreenColor,
              //backgroundImage: //Image.asset('assets/'),
            ),
            Column(
              children: [],
            )
          ],
        ));
  }
}
