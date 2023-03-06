import 'dart:convert';
import 'package:fastrash/repository/data/dummy_data.dart';
import 'package:fastrash/repository/data/response_data.dart';
import 'package:fastrash/repository/model/current_location_model.dart';

import 'package:http/http.dart' as client;
import 'package:geocoder_buddy/geocoder_buddy.dart';

class LocationBackend{


Future<CurrentLocationResponseModel?> getCurrentLocationDetails(GBLatLng pos) async {

  const path = "https://nominatim.openstreetmap.org";
  final httpConnectionApi = await client.get(
    Uri.parse('$path/reverse?lat=${pos.lat}&lon=${pos.lng}&format=jsonv2'),
  ).timeout(const Duration(seconds: 60));

  // logger.v(httpConnectionApi.body);
  // logger.v(httpConnectionApi.statusCode);


  if (httpConnectionApi.statusCode == 200) {
    // var data = await httpConnectionApi.stream.bytesToString();
    var resBody = jsonDecode(httpConnectionApi.body.toString());
    ResponseData.currentLocationResponseModel = CurrentLocationResponseModel.fromJson(resBody);
    ///logger.d(ResponseData.currentLocationResponseModel);

    DummyData.address = ResponseData.currentLocationResponseModel!.displayName.toString();
    ///logger.v(DummyData.address);
    return ResponseData.currentLocationResponseModel;
  } else {
    throw Exception(httpConnectionApi.reasonPhrase);
  }
}
}