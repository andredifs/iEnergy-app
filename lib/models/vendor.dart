import 'package:cloud_firestore/cloud_firestore.dart';

class Vendor {
  final String username;
  final String type;
  final String uid;
  final String email;
  final String cpfcnpj;
  final String distributor;
  final String cep;
  final String energyBill;
  final String description;

  const Vendor({
    required this.email,
    required this.type,
    required this.uid,
    required this.cpfcnpj,
    required this.username,
    required this.distributor,
    required this.cep,
    required this.energyBill,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'type': type,
        'uid': uid,
        'email': email,
        'cpfcnpj': cpfcnpj,
        'distributor': distributor,
        'cep': cep,
        'energyBill': energyBill,
      };
  static Vendor fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Vendor(
        username: snapshot['username'],
        type: snapshot['type'],
        uid: snapshot['uid'],
        email: snapshot['email'],
        cpfcnpj: snapshot['cpfcnpj'],
        distributor: snapshot['distributor'],
        cep: snapshot['cep'],
        energyBill: snapshot['energyBill'],
        description: snapshot['description']);
  }
}
