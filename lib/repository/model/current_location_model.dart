class CurrentLocationResponseModel {
  CurrentLocationResponseModel({
    required this.placeId,
    required this.licence,
    required this.osmType,
    required this.osmId,
    required this.lat,
    required this.lon,
    required this.placeRank,
    required this.category,
    required this.type,
    required this.importance,
    required this.addresstype,
    this.name,
    required this.displayName,
    required this.address,
    required this.boundingbox,
  });
  late final dynamic placeId;
  late final dynamic licence;
  late final dynamic osmType;
  late final dynamic osmId;
  late final dynamic lat;
  late final dynamic lon;
  late final dynamic placeRank;
  late final dynamic category;
  late final dynamic type;
  late final dynamic importance;
  late final dynamic addresstype;
  late final dynamic name;
  late final dynamic displayName;
  late final Address address;
  late final List<dynamic> boundingbox;

  CurrentLocationResponseModel.fromJson(Map<dynamic, dynamic> json){
    placeId = json['place_id'];
    licence = json['licence'];
    osmType = json['osm_type'];
    osmId = json['osm_id'];
    lat = json['lat'];
    lon = json['lon'];
    placeRank = json['place_rank'];
    category = json['category'];
    type = json['type'];
    importance = json['importance'];
    addresstype = json['addresstype'];
    name = dynamic;
    displayName = json['display_name'];
    address = Address.fromJson(json['address']);
    boundingbox = List.castFrom<dynamic, dynamic>(json['boundingbox']);
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
    _data['place_id'] = placeId;
    _data['licence'] = licence;
    _data['osm_type'] = osmType;
    _data['osm_id'] = osmId;
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['place_rank'] = placeRank;
    _data['category'] = category;
    _data['type'] = type;
    _data['importance'] = importance;
    _data['addresstype'] = addresstype;
    _data['name'] = name;
    _data['display_name'] = displayName;
    _data['address'] = address.toJson();
    _data['boundingbox'] = boundingbox;
    return _data;
  }
}

class Address {
  Address({
    required this.village,
    required this.county,
    required this.state,
    required this.postcode,
    required this.country,
    required this.countryCode,
  });
  late final dynamic village;
  late final dynamic county;
  late final dynamic state;
  late final dynamic postcode;
  late final dynamic country;
  late final dynamic countryCode;

  Address.fromJson(Map<dynamic, dynamic> json){
    village = json['village'];
    county = json['county'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
    countryCode = json['country_code'];
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
    _data['village'] = village;
    _data['county'] = county;
    _data['state'] = state;
    _data['postcode'] = postcode;
    _data['country'] = country;
    _data['country_code'] = countryCode;
    return _data;
  }
}