/// location : {"longitude":-122.084,"latitude":37.4219983}
/// _id : "6413f6907b4814c1ee2be62a"
/// userId : "63f85e50705601e9e6e003d9"
/// description : "I have some waste at Google Building 40, Amphitheatre Parkway, Mountain View, Santa Clara County, California, 94043, United States that needs to be collected, it weighs about 10 kg..."
/// status : "pending"
/// images : ["https://storage.googleapis.com/fastrash-image-upload/images-38489c84-854c-4887-8ce7-fd79ad53ce43-scaled_1000000020.jpg"]
/// address : "Google Building 40, Amphitheatre Parkway, Mountain View, Santa Clara County, California, 94043, United States"
/// role : "user"
/// quantity : 10
/// createdAt : "2023-03-17T05:11:44.856Z"
/// updatedAt : "2023-03-17T05:11:44.856Z"
/// __v : 0

class DepositHistoryModel {
  DepositHistoryModel({
    this.location,
    this.id,
    this.userId,
    this.description,
    this.status,
    this.images,
    this.address,
    this.role,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.collectorId,});

  DepositHistoryModel.fromJson(dynamic json) {
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    id = json['_id'];
    userId = json['userId'];
    description = json['description'];
    status = json['status'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    address = json['address'];
    role = json['role'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    collectorId = json['collectorId'];
  }
  Location? location;
  String? id;
  String? userId;
  String? description;
  String? status;
  List<String>? images;
  String? address;
  String? role;
  num? quantity;
  String? createdAt;
  String? updatedAt;
  num? v;
  String? collectorId;
  DepositHistoryModel copyWith({  Location? location,
    String? id,
    String? userId,
    String? description,
    String? status,
    List<String>? images,
    String? address,
    String? role,
    num? quantity,
    String? createdAt,
    String? updatedAt,
    num? v,
    String? collectorId,
  }) => DepositHistoryModel(  location: location ?? this.location,
    id: id ?? this.id,
    userId: userId ?? this.userId,
    description: description ?? this.description,
    status: status ?? this.status,
    images: images ?? this.images,
    address: address ?? this.address,
    role: role ?? this.role,
    quantity: quantity ?? this.quantity,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    v: v ?? this.v,
    collectorId: collectorId ?? this.collectorId,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['_id'] = id;
    map['userId'] = userId;
    map['description'] = description;
    map['status'] = status;
    map['images'] = images;
    map['address'] = address;
    map['role'] = role;
    map['quantity'] = quantity;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['collectorId'] = collectorId;
    return map;
  }

}

/// longitude : -122.0849872
/// latitude : 37.4226711

class Location {
  Location({
    this.longitude,
    this.latitude,});

  Location.fromJson(dynamic json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
  }
  num? longitude;
  num? latitude;
  Location copyWith({  num? longitude,
    num? latitude,
  }) => Location(  longitude: longitude ?? this.longitude,
    latitude: latitude ?? this.latitude,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['longitude'] = longitude;
    map['latitude'] = latitude;
    return map;
  }

}