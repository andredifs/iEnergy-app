// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:ienergy_app/resources/vendor_auth_methods.dart';
import 'package:ienergy_app/screens/login.dart';
import 'package:ienergy_app/utils/colors.dart';
import 'package:ienergy_app/utils/utils.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignupVendorScreen extends StatefulWidget {
  const SignupVendorScreen({Key? key}) : super(key: key);

  @override
  State<SignupVendorScreen> createState() => _SignupVendorScreenState();
}

class _SignupVendorScreenState extends State<SignupVendorScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpfcnpjController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _distributorController = TextEditingController();
  final TextEditingController _energyBillController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  bool _isLoading = false;

  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _cpfcnpjController.dispose();
    _usernameController.dispose();
    _cepController.dispose();
    _distributorController.dispose();
    _energyBillController.dispose();
    _descriptionController.dispose();
    _typeController.dispose();
  }

  void signupUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await VendorAuthMethods().signUpVendor(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      cpfcnpj: _cpfcnpjController.text,
      cep: _cepController.text,
      distributor: _distributorController.text,
      energyBill: _energyBillController.text,
      description: _descriptionController.text,
      type: _typeController.text,
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                TextFormField(
                  controller: _usernameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "Nome",
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    filled: true,
                    fillColor: greyColor,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _typeController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "Tipo de geração (Autônomo, Empresa, Fazenda)",
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    filled: true,
                    fillColor: greyColor,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    filled: true,
                    fillColor: greyColor,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "Senha",
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    filled: true,
                    fillColor: greyColor,
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _cpfcnpjController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "CPF/CNPJ",
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    filled: true,
                    fillColor: greyColor,
                  ),
                  inputFormatters: [MaskTextInputFormatter(mask: '###.###.###-##', type: MaskAutoCompletionType.eager)],
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _cepController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "CEP",
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    filled: true,
                    fillColor: greyColor,
                  ),
                  inputFormatters: [MaskTextInputFormatter(mask: '#####-###', type: MaskAutoCompletionType.eager)],
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _distributorController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "Distribuídora",
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    filled: true,
                    fillColor: greyColor,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _descriptionController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "Média de crédito excedente mensal",
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    filled: true,
                    fillColor: greyColor,
                  ),
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
                          : const Text("Log in")),
                ),
                const SizedBox(height: 24),
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
      ),
    );
  }
}
