class CollectionsHistoryModel {
  CollectionsHistoryModel({
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
    this.v,});

  CollectionsHistoryModel.fromJson(dynamic json) {
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
  CollectionsHistoryModel copyWith({  Location? location,
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
  }) => CollectionsHistoryModel(  location: location ?? this.location,
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
    return map;
  }

}

/// longitude : -122.084
/// latitude : 37.4219983

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