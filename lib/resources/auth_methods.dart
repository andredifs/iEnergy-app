import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ienergy_app/models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  Future<String> signUpUser(
      {required String email,
      required String password,
      required String username,
      required String cpf,
      required String distributor,
      required String cep,
      required String energyBill}) async {
    String res = "some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          cpf.isNotEmpty ||
          cep.isNotEmpty ||
          distributor.isNotEmpty) {
        UserCredential _cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        model.User user = model.User(
            email: email,
            uid: _cred.user!.uid,
            cpf: cpf,
            username: username,
            cep: cep,
            distributor: distributor,
            energyBill: energyBill);
        await _firestore
            .collection('users')
            .doc(_cred.user!.uid)
            .set(user.toJson());
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

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
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
