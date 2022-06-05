import 'package:flutter/material.dart';
import 'package:ienergy_app/models/customer.dart';
import 'package:ienergy_app/resources/auth_methods.dart';

class CustomerProvider with ChangeNotifier {
  Customer? _customer;
  final CustomerAuthMethods _customerAuthMethods = CustomerAuthMethods();

  Customer get getCustomer => _customer!;

  Future<void> refreshCustomer() async {
    Customer customer = await _customerAuthMethods.getCustomerDetails();
    _customer = customer;
    notifyListeners();
  }
}
