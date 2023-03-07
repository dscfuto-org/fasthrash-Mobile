class LoginResponseModel {
  LoginResponseModel({
      this.message, 
      this.id, 
      this.firstName, 
      this.lastName, 
      this.location, 
      this.email, 
      this.phoneNumber, 
      this.role, 
      this.history, 
      this.token,});

  LoginResponseModel.fromJson(dynamic json) {
    message = json['message'];
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    location = json['location'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    role = json['role'];
    if (json['history'] != null) {
      history = [];
      json['history'].forEach((v) {
        // history?.add(Dynamic.fromJson(v));
      });
    }
    token = json['token'];
  }
  String? message;
  String? id;
  String? firstName;
  String? lastName;
  String? location;
  String? email;
  String? phoneNumber;
  String? role;
  List<dynamic>? history;
  String? token;
LoginResponseModel copyWith({  String? message,
  String? id,
  String? firstName,
  String? lastName,
  String? location,
  String? email,
  String? phoneNumber,
  String? role,
  List<dynamic>? history,
  String? token,
}) => LoginResponseModel(  message: message ?? this.message,
  id: id ?? this.id,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  location: location ?? this.location,
  email: email ?? this.email,
  phoneNumber: phoneNumber ?? this.phoneNumber,
  role: role ?? this.role,
  history: history ?? this.history,
  token: token ?? this.token,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['location'] = location;
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['role'] = role;
    if (history != null) {
      map['history'] = history?.map((v) => v.toJson()).toList();
    }
    map['token'] = token;
    return map;
  }

}