import 'package:connectivity/connectivity.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uber_flutter/helpers/request_helper.dart';

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

    if (response != 'Failed!') {
      placeAddress = response['results'][0]['formatted_address'];
    }

    return placeAddress;
  }
}
