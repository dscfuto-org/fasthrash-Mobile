class AlertCreateResponseModel {
  AlertCreateResponseModel({
      this.status, 
      this.data,});

  AlertCreateResponseModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  Data? data;
AlertCreateResponseModel copyWith({  String? status,
  Data? data,
}) => AlertCreateResponseModel(  status: status ?? this.status,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.alert,});

  Data.fromJson(dynamic json) {
    alert = json['alert'] != null ? Alert.fromJson(json['alert']) : null;
  }
  Alert? alert;
Data copyWith({  Alert? alert,
}) => Data(  alert: alert ?? this.alert,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (alert != null) {
      map['alert'] = alert?.toJson();
    }
    return map;
  }

}

class Alert {
  Alert({
      this.title, 
      this.description, 
      this.status, 
      this.image, 
      this.location, 
      this.quantity, 
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  Alert.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    status = json['status'];
    image = json['image'];
    location = json['location'];
    quantity = json['quantity'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? title;
  String? description;
  String? status;
  String? image;
  String? location;
  num? quantity;
  String? id;
  String? createdAt;
  String? updatedAt;
  num? v;
Alert copyWith({  String? title,
  String? description,
  String? status,
  String? image,
  String? location,
  num? quantity,
  String? id,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => Alert(  title: title ?? this.title,
  description: description ?? this.description,
  status: status ?? this.status,
  image: image ?? this.image,
  location: location ?? this.location,
  quantity: quantity ?? this.quantity,
  id: id ?? this.id,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  v: v ?? this.v,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['status'] = status;
    map['image'] = image;
    map['location'] = location;
    map['quantity'] = quantity;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}