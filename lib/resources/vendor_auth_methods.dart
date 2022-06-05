import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ienergy_app/models/vendor.dart' as model;

class VendorAuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.Vendor> getVendorDetails() async {
    User currentVendor = _auth.currentUser!;

    DocumentSnapshot snap = await _firestore.collection('vendors').doc(currentVendor.uid).get();

    return model.Vendor.fromSnap(snap);
  }

  Future<String> signUpVendor({
    required String email,
    required String type,
    required String password,
    required String username,
    required String cpfcnpj,
    required String distributor,
    required String cep,
    required String energyBill,
    required String description,
  }) async {
    String res = "some error occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || cpfcnpj.isNotEmpty || cep.isNotEmpty || distributor.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        model.Vendor vendor = model.Vendor(
          email: email,
          type: type,
          uid: cred.user!.uid,
          cpfcnpj: cpfcnpj,
          username: username,
          cep: cep,
          distributor: distributor,
          energyBill: energyBill,
          description: description,
        );
        await _firestore.collection('vendors').doc(cred.user!.uid).set(vendor.toJson());
        res = 'success';
      }
      // } on FirebaseAuthException catch (err) {
      //   if (err.code == 'invalid-email') {
      //     res = 'The email is badly formated';
      //   } else if (err.code == 'weak-password') {
      //     res = 'Your password must have at least 6 characters';
      //   }
      // }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginVendor({
    required String email,
    required String password,
  }) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = 'success';
      } else {
        res = 'Please enter all the fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
