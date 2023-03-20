

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
    this.userName,
    this.userEmail,
    this.userPhone,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.collectorEmail,
    this.collectorId,
    this.collectorName,
    this.collectorPhone,});

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
    userName = json['userName'];
    userEmail = json['userEmail'];
    userPhone = json['userPhone'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    collectorEmail = json['collectorEmail'];
    collectorId = json['collectorId'];
    collectorName = json['collectorName'];
    collectorPhone = json['collectorPhone'];
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
  String? userName;
  String? userEmail;
  String? userPhone;
  String? createdAt;
  String? updatedAt;
  num? v;
  String? collectorEmail;
  String? collectorId;
  String? collectorName;
  String? collectorPhone;
  CollectionsHistoryModel copyWith({  Location? location,
    String? id,
    String? userId,
    String? description,
    String? status,
    List<String>? images,
    String? address,
    String? role,
    num? quantity,
    String? userName,
    String? userEmail,
    String? userPhone,
    String? createdAt,
    String? updatedAt,
    num? v,
    String? collectorEmail,
    String? collectorId,
    String? collectorName,
    String? collectorPhone,
  }) => CollectionsHistoryModel(  location: location ?? this.location,
    id: id ?? this.id,
    userId: userId ?? this.userId,
    description: description ?? this.description,
    status: status ?? this.status,
    images: images ?? this.images,
    address: address ?? this.address,
    role: role ?? this.role,
    quantity: quantity ?? this.quantity,
    userName: userName ?? this.userName,
    userEmail: userEmail ?? this.userEmail,
    userPhone: userPhone ?? this.userPhone,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    v: v ?? this.v,
    collectorEmail: collectorEmail ?? this.collectorEmail,
    collectorId: collectorId ?? this.collectorId,
    collectorName: collectorName ?? this.collectorName,
    collectorPhone: collectorPhone ?? this.collectorPhone,
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
    map['userName'] = userName;
    map['userEmail'] = userEmail;
    map['userPhone'] = userPhone;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['collectorEmail'] = collectorEmail;
    map['collectorId'] = collectorId;
    map['collectorName'] = collectorName;
    map['collectorPhone'] = collectorPhone;
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
