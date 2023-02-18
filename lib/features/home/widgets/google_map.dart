import 'dart:async';
import 'dart:developer';

import 'package:fastrash/features/home/widgets/my_location_button.dart';
import 'package:fastrash/utils/device_location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMap extends StatefulWidget {
  const GMap({Key? key}) : super(key: key);

  @override
  State<GMap> createState() => GMapState();
}

class GMapState extends State<GMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final DeviceLocation deviceLocation = DeviceLocation();
  Marker? marker;

  static const CameraPosition futoLocation = CameraPosition(
    target: LatLng(5.3927, 6.9861),
    zoom: 14.4746,
  );

  @override
  void initState() {
    ///deviceLocation.getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: futoLocation,
            markers: {
              if (marker != null) marker!,
            },
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          MyLocationButton(onTap: _myLoaction),
        ],
      ),
    );
  }

  Future<void> _myLoaction() async {
    _addMaker;
    log('This is the main page lat = ${DeviceLocation.lat} and lng = ${DeviceLocation.lng} ');
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(DeviceLocation.lat, DeviceLocation.lng),
          zoom: 18,
          tilt: 30,
        ),
      ),
    );
  }

  void _addMaker() async {
    // if (marker == null) {

    setState(() {
      marker = Marker(
        markerId: const MarkerId('My Location'),
        infoWindow: const InfoWindow(title: 'Location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: LatLng(DeviceLocation.lat, DeviceLocation.lng),
      );
    });
    log(marker.toString() + 'marker');
  }
}
