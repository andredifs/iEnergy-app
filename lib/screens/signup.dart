// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:ienergy_app/screens/login.dart';
import 'package:ienergy_app/screens/signup_customer.dart';
import 'package:ienergy_app/utils/colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Flexible(flex: 2, child: Container()),
            const Text(
              "Como deseja se\ncadastrar?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: greenColor),
            ),
            const SizedBox(height: 48),
            GestureDetector(
              onTap: () => {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SignupCustomerScreen())),
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: const BoxDecoration(color: greenColor, borderRadius: BorderRadius.all(Radius.circular(4))),
                child: const Center(
                  child: Text("Sou consumidor", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
                ),
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SignupCustomerScreen())),
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                width: MediaQuery.of(context).size.width * 0.8,
                // margin: ,
                decoration: const BoxDecoration(color: greenColor, borderRadius: BorderRadius.all(Radius.circular(4))),
                child: const Center(
                  child: Text("Sou gerador", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
                ),
              ),
            ),
            const SizedBox(height: 36),
            Flexible(flex: 2, child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text("Já possui uma conta? "),
                ),
                GestureDetector(
                  onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen()))},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text('Login', style: TextStyle(color: greenColor, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
