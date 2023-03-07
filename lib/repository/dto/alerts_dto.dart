class AlertsDto {
  AlertsDto({
      this.title, 
      this.description, 
      this.image, 
      this.location, 
      this.quantity,});

  AlertsDto.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    image = json['image'];
    location = json['location'];
    quantity = json['quantity'];
  }
  String? title;
  String? description;
  String? image;
  String? location;
  num? quantity;
AlertsDto copyWith({  String? title,
  String? description,
  String? image,
  String? location,
  num? quantity,
}) => AlertsDto(  title: title ?? this.title,
  description: description ?? this.description,
  image: image ?? this.image,
  location: location ?? this.location,
  quantity: quantity ?? this.quantity,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['image'] = image;
    map['location'] = location;
    map['quantity'] = quantity;
    return map;
  }

}