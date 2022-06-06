import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ienergy_app/responsive/mobile_screen_layout.dart';
import 'package:ienergy_app/screens/home_costumer.dart';
import 'package:ienergy_app/utils/colors.dart';

class ContractScreen extends StatelessWidget {
  ContractScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigateToHome() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MobileScreenLayout()));
    }

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.lightbulb),
        backgroundColor: greenColor,
        centerTitle: false,
        title: const Text(
          'iEnergy',
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.message_outlined))],
      ),
      body: Column(
        children: [
          const SizedBox(height: 90),
          Center(
            child: CircleAvatar(
              radius: 80,
              backgroundColor: secondaryGreenColor,
              child: SvgPicture.asset('lib/assets/check.svg', color: primaryColor, height: 60, width: 60),
            ),
          ),
          const SizedBox(height: 70),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: const Center(
                child: Text(
              textAlign: TextAlign.center,
              'SEU PEDIDO FOI ENVIADO COM\nSUCESSO, EM BREVE VOCÊ\nRECEBERÁ O CONTRATO',
              style: TextStyle(fontSize: 30),
            )),
          ),
          const SizedBox(height: 70),
          GestureDetector(
            onTap: navigateToHome,
            child: Center(
              child: const Text('VER MAIS OFERTAS', textAlign: TextAlign.center, style: TextStyle(color: greenColor, fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ),
          Flexible(flex: 2, child: Container()),
        ],
      ),
    );
  }
}
