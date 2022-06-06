import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ienergy_app/screens/login.dart';
import 'package:ienergy_app/screens/sale_screen.dart';
import 'package:ienergy_app/utils/colors.dart';
import 'package:ienergy_app/widgets/sale_card.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.lightbulb,
          color: primaryColor,
        ),
        backgroundColor: greenColor,
        centerTitle: false,
        title: const Text(
          'iEnergy',
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.message_outlined))],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('vendors').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => SaleCard(snap: snapshot.data!.docs[index].data()),
          );
        },
      ),
    );
  }
}
