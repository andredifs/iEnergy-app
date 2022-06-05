import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  final String username;
  final String uid;
  final String email;
  final String cpf;
  final String distributor;
  final String cep;
  final String energyBill;

  const Customer({
    required this.email,
    required this.uid,
    required this.cpf,
    required this.username,
    required this.distributor,
    required this.cep,
    required this.energyBill,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'cpf': cpf,
        'distributor': distributor,
        'cep': cep,
        'energyBill': energyBill,
      };
  static Customer fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Customer(
      username: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      cpf: snapshot['cpf'],
      distributor: snapshot['distributor'],
      cep: snapshot['cep'],
      energyBill: snapshot['energyBill'],
    );
  }
}
