import 'package:connectivity/connectivity.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uber_flutter/datamodels/address.dart';
import 'package:uber_flutter/helpers/request_helper.dart';
import 'package:provider/provider.dart';

class HelperMethods {
  static Future<String> findCordinateAddress(Position position) async {
    String placeAddress = "";
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) {
      return placeAddress;
    }

    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyCdEPScUYGrLyrWem8LCY9XHvdVbHO0H80";

    var response = await RequestHelper.getRequest(url);

    print(response.body);

    if (response != 'Failed!') {
      placeAddress = response['results'][0]['formatted_address'];

      Address pickupAddress = new Address();
      
      pickupAddress.latitude = position.latitude;
      pickupAddress.longitude = position.longitude;
      pickupAddress.placeName = placeAddress;
      
    }

    return placeAddress;
  }
}
