import 'package:flutter/material.dart';
import 'package:ienergy_app/models/vendor.dart';
import 'package:ienergy_app/resources/vendor_auth_methods.dart';

class VendorProvider with ChangeNotifier {
  Vendor? _vendor;
  final VendorAuthMethods _vendorAuthMethods = VendorAuthMethods();

  Vendor get getVendor => _vendor!;

  Future<void> refreshVendor() async {
    Vendor vendor = await _vendorAuthMethods.getVendorDetails();
    _vendor = vendor;
    notifyListeners();
  }
}
