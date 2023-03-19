import 'dart:async';
import 'package:fastrash/repository/backend/alerts_backend.dart';
import 'package:fastrash/repository/data/response_data.dart';
import 'package:fastrash/utils/alerts.dart';
import 'package:fastrash/utils/custom_print.dart';
import 'package:fastrash/utils/loaders.dart';
import 'package:fastrash/utils/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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


  late BitmapDescriptor myIcon;
  bool isLoading =false;
  final List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadMarkers().then((value) => setState(() {
        isLoading = false;
      }));
    });

    ResponseData.profileResponseModel!.data!.user!.role == "user" ? getCurrentLocation() :   _loadMarkers();

    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48.w, 20.h)), "assets/images/trash_icon.png").then((onValue) {
      myIcon = onValue;
    });
  }


  Future<void> _loadMarkers() async {
    // // Load JSON object from file or API
    // String jsonString = '[{"id":1,"latitude":40.712776,"longitude":-74.005974},{"id":2,"latitude":51.507351,"longitude":-0.127758}]';
    // List<dynamic> data = json.decode(jsonString);

    // Create a Marker object for each location
    for (var item in ResponseData.allAlertsResponseModel) {
      double lat = double.parse(item.location!.latitude.toString());
      double lng =  double.parse(item.location!.longitude.toString());
      LatLng latLng = LatLng(lat, lng);
      Marker marker = Marker(
        markerId: MarkerId(item.id.toString()),
        position: latLng,
        ///icon: myIcon,
        ///infoWindow: InfoWindow(title: 'Marker ${item.id.toString()}'),
        infoWindow: InfoWindow(title: '${item.quantity.toString()} kg waste at  ${item.address.toString()}', onTap: (){
          showInfoAlert(
            context,
            " ",
            isDismissible: true,
            btnOneText: "Accept",
            btnTwoText: "Back",
            btnOnePressed: () async {
              setState(() {
                isLoading = true;
              });

              try {
                displayLongToastMessage("Please wait...");
                AlertsBackend().updateUTCAlert(context, alertId: item.id.toString(),
                    status: "accepted", userId:  item.userId.toString(), collectorId:
                    ResponseData.profileResponseModel!.data!.user!.id.toString());
                await _loadMarkers();

              } catch (e) {
                setState(() {
                  isLoading = false;
                });

                rethrow;
              }

              setState(() {
                isLoading = false;
              });


            },
            btnTwoPressed: () =>
                navigateBack(context),
            message:
            " ${item.quantity.toString()} kg waste at ${item.address.toString()}",
          );
      }),
      );
      _markers.add(marker);
    }

    // Update state to trigger rebuild
    setState(() {});


  }



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
  dispose() {
    super.dispose();
    // ignore: null_argument_to_non_null_type
    ///_controller.complete();
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
    logger.v(ResponseData.allAlertsResponseModel);
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),),
      child: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            compassEnabled: false,
            zoomControlsEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            zoomGesturesEnabled: false,
            markers: ResponseData.profileResponseModel!.data!.user!.role == "collector" ? Set<Marker>.of(_markers) : const <Marker>{},
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);

            },
          ),
          isLoading ?  Container(
            color: Colors.white.withOpacity(0.7),
            child: const Center(
                child: loaderOne
            ),
          ) : Container()
        ],
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
