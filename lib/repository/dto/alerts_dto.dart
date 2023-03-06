class AlertsDto {
  AlertsDto({
      this.description, 
      this.status, 
      this.image, 
      this.locationlongitude, 
      this.locationlatitude, 
      this.address, 
      this.role, 
      this.quantity,});

  AlertsDto.fromJson(dynamic json) {
    description = json['description'];
    status = json['status'];
    image = json['image'];
    locationlongitude = json['location.longitude'];
    locationlatitude = json['location.latitude'];
    address = json['address'];
    role = json['role'];
    quantity = json['quantity'];
  }
  String? description;
  String? status;
  String? image;
  num? locationlongitude;
  num? locationlatitude;
  String? address;
  String? role;
  num? quantity;
AlertsDto copyWith({  String? description,
  String? status,
  String? image,
  num? locationlongitude,
  num? locationlatitude,
  String? address,
  String? role,
  num? quantity,
}) => AlertsDto(  description: description ?? this.description,
  status: status ?? this.status,
  image: image ?? this.image,
  locationlongitude: locationlongitude ?? this.locationlongitude,
  locationlatitude: locationlatitude ?? this.locationlatitude,
  address: address ?? this.address,
  role: role ?? this.role,
  quantity: quantity ?? this.quantity,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    map['status'] = status;
    map['image'] = image;
    map['location.longitude'] = locationlongitude;
    map['location.latitude'] = locationlatitude;
    map['address'] = address;
    map['role'] = role;
    map['quantity'] = quantity;
    return map;
  }

}