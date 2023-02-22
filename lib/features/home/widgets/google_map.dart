import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class UserLocationMap extends StatefulWidget {
  const UserLocationMap({Key? key}) : super(key: key);

  @override
  UserLocationMapState createState() => UserLocationMapState();
}

class UserLocationMapState extends State<UserLocationMap> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );



  // ignore: non_constant_identifier_names
  final double CAMERA_ZOOM = 16;

//  final double CAMERA_TILT = 80;
  // ignore: non_constant_identifier_names
  final double CAMERA_BEARING = 30;

  // ignore: non_constant_identifier_names
  final LatLng SOURCE_LOCATION = const LatLng(42.747932, -71.167889);

  // ignore: non_constant_identifier_names
  LatLng DEST_LOCATION = const LatLng(37.335685, -122.0605916);


// for my drawn routes on the map
  List<LatLng> polylineCoordinates = [];


// for my custom marker pins
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;

// the user's initial location and current location
// as it moves
  //AIzaSyCbQB5ArOxQOvkDdgVwrT4oQJ_epy15lbk
  late LocationData currentLocation;

// a reference to the destination location
  late LocationData destinationLocation;

// wrapper around the location API
  Location location = Location();

  // final Connectivity _connectivity = Connectivity();
  // late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  //

  getCurrentLocation() {
    // create an instance of Location
    location = Location();


    location.onLocationChanged.listen((LocationData cLoc) {
      // cLoc contains the lat and long of the
      // current user's position in real time,
      // so we're holding on to it
      currentLocation = cLoc;
      updatePinOnMap(context);
//      if (currentLocation.latitude == destinationLocation.latitude &&
//          currentLocation.longitude == destinationLocation.longitude) {
//        // rider reached location
//        // alert rider
//      }
    });
  }


  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    // _connectivitySubscription =
    //     _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  dispose() {
    super.dispose();
    // ignore: null_argument_to_non_null_type
    _controller.complete();
   /// _connectivitySubscription.cancel();
  }
  //
  // Future<void> _updateConnectionStatus(ConnectivityResult result) async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile) {
  //   } else if (connectivityResult == ConnectivityResult.wifi) {
  //   } else
  //     _customAlertDialog(context, AlertDialogType.WARNING );
  //   //showNetworkErrorDialog(context, " No Internet Connection");
  // }
  //


  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),),
      child: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        compassEnabled: false,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        initialCameraPosition: _kGooglePlex,
        zoomGesturesEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }


  void updatePinOnMap(BuildContext context) async {
    // create a new CameraPosition instance
    // every time the location changes, so the camera
    // follows the pin as it moves with an animation
    //logger.e(currentLocation.latitude);
    CameraPosition cPosition = CameraPosition(
      zoom: CAMERA_ZOOM,
//      tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
    // do this inside the setState() so Flutter gets notified
    // that a widget update is due
  }


}
