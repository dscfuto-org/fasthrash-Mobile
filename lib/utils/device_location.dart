import 'package:flutter/material.dart';
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
        debugPrint(currentLocation.latitude!.toString());
        debugPrint(currentLocation.longitude!.toString());

        lat = currentLocation.latitude!;
        lng = currentLocation.longitude!;
      } on Exception catch (e) {
        print('Error coming from $e');
      }
    });
  }
}
