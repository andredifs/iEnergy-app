import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ienergy_app/models/customer.dart' as model;

class CustomerAuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.Customer> getCustomerDetails() async {
    User currentCustomer = _auth.currentUser!;

    DocumentSnapshot snap = await _firestore.collection('customers').doc(currentCustomer.uid).get();

    return model.Customer.fromSnap(snap);
  }

  Future<String> signUpCustomer({
    required String email,
    required String password,
    required String username,
    required String cpf,
    required String distributor,
    required String cep,
    required String energyBill,
  }) async {
    String res = "some error occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || cpf.isNotEmpty || cep.isNotEmpty || distributor.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        model.Customer customer = model.Customer(
          email: email,
          uid: cred.user!.uid,
          cpf: cpf,
          username: username,
          cep: cep,
          distributor: distributor,
          energyBill: energyBill,
        );
        await _firestore.collection('customers').doc(cred.user!.uid).set(customer.toJson());
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

  Future<String> loginCustomer({
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
