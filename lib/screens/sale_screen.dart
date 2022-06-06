import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ienergy_app/models/customer.dart';
import 'package:ienergy_app/providers/customer_provider.dart';
import 'package:ienergy_app/screens/contract.dart';
import 'package:ienergy_app/utils/colors.dart';
import 'package:provider/provider.dart';

class SaleScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final snap;
  SaleScreen({Key? key, this.snap}) : super(key: key);

  // Future<void> makeContract(Customer customer) async {
  //   if (customer == null) return;
  //   await _firestore.collection('customers').doc(snap['uid']).collection('clients').doc().set(customer.toJson());
  // }

  @override
  Widget build(BuildContext context) {
    void navigateToContract() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ContractScreen()));
    }

    // final Customer customer = Provider.of<CustomerProvider>(context).getCustomer;
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
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Center(
                  child: Text(
                snap['username'],
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              const SizedBox(height: 54),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                child: Image.network(
                  'https://s2.glbimg.com/dKOX-TdjMZkoWAIHeQz34C8VwNY=/e.glbimg.com/og/ed/f/original/2019/10/06/ca_.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 54),
              Center(child: Text(snap['description'])),
              const SizedBox(height: 54),
              Center(
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Desconto esperado: "),
                  const Text('10% a 15%', style: TextStyle(color: greenColor)),
                ]),
              ),
              InkWell(
                onTap: navigateToContract,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(color: greenColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4)))),
                  child: const Text(
                    "CONTRATE",
                    style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
