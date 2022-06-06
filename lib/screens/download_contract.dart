import 'package:flutter/material.dart';
import 'package:ienergy_app/utils/colors.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'iEnergy',
            style: TextStyle(color: primaryColor),
          ),
          backgroundColor: greenColor,
          leading: const Icon(
            Icons.lightbulb,
            color: primaryColor,
          )),
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.download),
          onPressed: () {},
        ),
      ),
    );
  }
}
