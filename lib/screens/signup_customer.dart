// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:ienergy_app/resources/auth_methods.dart';
import 'package:ienergy_app/screens/login.dart';
import 'package:ienergy_app/utils/colors.dart';
import 'package:ienergy_app/utils/utils.dart';
import 'package:ienergy_app/widgets/text_field_input.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignupCustomerScreen extends StatefulWidget {
  const SignupCustomerScreen({Key? key}) : super(key: key);

  @override
  State<SignupCustomerScreen> createState() => _SignupCustomerScreenState();
}

class _SignupCustomerScreenState extends State<SignupCustomerScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _distributorController = TextEditingController();
  final TextEditingController _energyBillController = TextEditingController();
  bool _isLoading = false;

  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _cpfController.dispose();
    _usernameController.dispose();
    _cepController.dispose();
    _distributorController.dispose();
    _energyBillController.dispose();
  }

//   void selectImage() async {
//     Uint8List img = await pickImage(ImageSource.gallery);
//     setState(() {
//       _image = img;
//     });
//   }

  void signupUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      cpf: _cpfController.text,
      cep: _cepController.text,
      distributor: _distributorController.text,
      energyBill: _energyBillController.text,
    );
    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
    setState(() {
      _isLoading = false;
    });
  }

  void navigateToLogin() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        leading: const Icon(Icons.arrow_back),
        centerTitle: false,
        title: const Text(
          'iEnergy',
          style: TextStyle(color: primaryColor),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.message_outlined))],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 2, child: Container()),
              const SizedBox(height: 24),
              TextFieldInput(
                textEditingController: _usernameController,
                hintText: "Enter your username",
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 24),
              TextFieldInput(
                textEditingController: _emailController,
                hintText: "Enter your email",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: "Enter your password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _cpfController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  // contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: "Enter your cpf",
                ),
                inputFormatters: [MaskTextInputFormatter(mask: '###.###.###-##', type: MaskAutoCompletionType.eager)],
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: signupUser,
                child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(color: greenColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4)))),
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: primaryColor,
                          ))
                        : const Text("Enviar", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold))),
              ),
              const SizedBox(height: 12),
              Flexible(flex: 2, child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Já possui uma conta? "),
                  ),
                  GestureDetector(
                    onTap: navigateToLogin,
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
      ),
    );
  }
}
