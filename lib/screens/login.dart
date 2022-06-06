// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ienergy_app/resources/auth_methods.dart';
import 'package:ienergy_app/resources/vendor_auth_methods.dart';
import 'package:ienergy_app/responsive/mobile_screen_layout.dart';
import 'package:ienergy_app/screens/home_costumer.dart';
import 'package:ienergy_app/screens/signup.dart';
import 'package:ienergy_app/utils/colors.dart';
import 'package:ienergy_app/utils/utils.dart';
import 'package:ienergy_app/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginCustomer() async {
    setState(() {
      _isLoading = true;
    });
    String res = await CustomerAuthMethods().loginCustomer(email: _emailController.text, password: _passwordController.text);

    if (res == 'success') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MobileScreenLayout()));
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void loginVendor() async {
    setState(() {
      _isLoading = true;
    });
    String res = await VendorAuthMethods().loginVendor(email: _emailController.text, password: _passwordController.text);

    if (res == 'success') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MobileScreenLayout()));
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void navigateToSignUp() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SignupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: greenColor,
          centerTitle: false,
          leading: Icon(Icons.lightbulb),
          title: const Text(
            'iEnergy',
            style: TextStyle(color: primaryColor),
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            // width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Flexible(flex: 2, child: Container()),
                const SizedBox(height: 100),
                const Text(
                  "iEnergy",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: greenColor),
                ),
                // SvgPicture.asset('assets/hit_spotImage.svg', color: primaryColor, height: 64)s
                const SizedBox(height: 54),
                const TabBar(tabs: [
                  Tab(child: Text("Sou consumidor", style: TextStyle(color: greenColor))),
                  Tab(child: Text("Sou gerador", style: TextStyle(color: greenColor))),
                ]),
                Flexible(
                  flex: 1,
                  child: TabBarView(children: [
                    customerLogin(),
                    customerLogin(),
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text('Ainda não tem cadastro? '),
                    ),
                    GestureDetector(
                      onTap: navigateToSignUp,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text('Faça aqui', style: TextStyle(color: greenColor, fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customerLogin() {
    return Column(
      children: [
        const SizedBox(height: 12),
        TextFieldInput(
          textEditingController: _emailController,
          hintText: "Email",
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 24),
        TextFieldInput(
          textEditingController: _passwordController,
          hintText: "Senha",
          textInputType: TextInputType.text,
          isPass: true,
        ),
        const SizedBox(height: 24),
        InkWell(
          onTap: loginCustomer,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const ShapeDecoration(color: greenColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4)))),
            child: _isLoading
                ? const Center(child: CircularProgressIndicator(color: primaryColor))
                : const Text(
                    "Login",
                    style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ],
    );
  }

  Widget vendorLogin() {
    return Column(
      children: [
        const SizedBox(height: 12),
        TextFieldInput(
          textEditingController: _emailController,
          hintText: "Email",
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 24),
        TextFieldInput(
          textEditingController: _passwordController,
          hintText: "Senha",
          textInputType: TextInputType.text,
          isPass: true,
        ),
        const SizedBox(height: 24),
        InkWell(
          onTap: loginVendor,
          child: Container(
              // width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(color: greenColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4)))),
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator(color: primaryColor))
                  : const Text(
                      "Login",
                      style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                    )),
        ),
      ],
    );
  }
}
