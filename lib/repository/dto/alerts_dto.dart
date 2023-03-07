class AlertsDto {
  AlertsDto({
      this.description, 
      this.status, 
      this.image, 
      this.location, 
      this.quantity,});

  AlertsDto.fromJson(dynamic json) {
    description = json['description'];
    status = json['status'];
    image = json['image'];
    location = json['location'];
    quantity = json['quantity'];
  }
  String? description;
  String? status;
  String? image;
  String? location;
  num? quantity;
AlertsDto copyWith({  String? description,
  String? status,
  String? image,
  String? location,
  num? quantity,
}) => AlertsDto(  description: description ?? this.description,
  status: status ?? this.status,
  image: image ?? this.image,
  location: location ?? this.location,
  quantity: quantity ?? this.quantity,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    map['status'] = status;
    map['image'] = image;
    map['location'] = location;
    map['quantity'] = quantity;
    return map;
  }

}