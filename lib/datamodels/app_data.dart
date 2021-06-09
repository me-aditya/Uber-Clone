import 'package:flutter/material.dart';
import 'package:uber_flutter/datamodels/address.dart';

class AppData extends ChangeNotifier {
  Address pickupAddress;

  void updatePickupAddress(Address pickup) {
    pickupAddress = pickup;
    notifyListeners();
  }
}
