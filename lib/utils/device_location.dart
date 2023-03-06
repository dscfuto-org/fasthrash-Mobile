import 'package:fastrash/repository/backend/location_backend.dart';
import 'package:fastrash/utils/custom_print.dart';
import 'package:geocoder_buddy/geocoder_buddy.dart';
import 'package:location/location.dart';

class DeviceLocation {
  Location location = Location();
  static double lat = 0;
  static double lng = 0;

  late bool _serviceEnabled;
  PermissionStatus? _permissionGranted;
// LocationData _lo cationData;

  Future getCurrentLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    location.onLocationChanged.listen((LocationData currentLocation) async {
      try {

        GBLatLng pos = GBLatLng(
            lat:  double.parse(currentLocation.latitude.toString()),
            lng:  double.parse(currentLocation.longitude.toString()));

        lat = currentLocation.latitude!;
        lng = currentLocation.longitude!;

        // print(currentLocation.latitude);
        // print(currentLocation.longitude);

        await LocationBackend().getCurrentLocationDetails(pos);

      } on Exception catch (e) {
        logger.e(e);
      }
      //print(DummyData.address.toString() + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

    });
  }
}
