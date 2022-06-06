import 'package:flutter/material.dart';
import 'package:ienergy_app/screens/login.dart';
import 'package:ienergy_app/screens/sale_screen.dart';
import 'package:ienergy_app/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SaleCard extends StatelessWidget {
  final snap;
  const SaleCard({Key? key, this.snap}) : super(key: key);

  String imageType() {
    if (snap['type'] == 'condominio') {
      return 'lib/assets/farm.svg';
    } else if (snap['type'] == 'autonomo') {
      return 'lib/assets/person.svg';
    } else if (snap['type'] == 'empresa') {
      return 'lib/assets/company.svg';
    } else {
      return 'lib/assets/light.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    void navigateToSale() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => SaleScreen(
                snap: snap,
              )));
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: secondaryGreenColor,
            child: SvgPicture.asset(imageType(), color: primaryColor, height: 38, width: 38),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  snap['username'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Text(
                  '${snap['type']}   Ecomonomia: 10%~20%',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),
          IconButton(
            onPressed: () => navigateToSale(),
            icon: const Icon(
              Icons.arrow_forward,
              color: secondaryGreenColor,
            ),
          )
        ],
      ),
    );
  }
}
