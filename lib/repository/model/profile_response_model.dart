/// message : "User profile"
/// data : {"user":{"profileImage":"https://media.istockphoto.com/id/522855255/vector/male-profile-flat-blue-simple-icon-with-long-shadow.jpg?s=612x612&w=0&k=20&c=EQa9pV1fZEGfGCW_aEK5X_Gyob8YuRcOYCYZeuBzztM=","depositHistories":[],"collectionHistories":[],"_id":"63f85e50705601e9e6e003d9","firstName":"Victory","lastName":"Emmanuel","location":"string","email":"vicemmanuel7@gmail.com","phoneNumber":"08024391710","password":"$2b$12$aqQhqPJrl4H4IddSc7SEnueO28RDS/SYVbYyKsRUFZSmuWYRZ5LVm","passwordConfirm":"True","role":"user","histories":[],"createdAt":"2023-02-24T06:50:56.428Z","updatedAt":"2023-02-24T06:50:56.428Z","__v":0}}

class ProfileResponseModel {
  ProfileResponseModel({
      this.message, 
      this.data,});

  ProfileResponseModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? message;
  Data? data;
ProfileResponseModel copyWith({  String? message,
  Data? data,
}) => ProfileResponseModel(  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// user : {"profileImage":"https://media.istockphoto.com/id/522855255/vector/male-profile-flat-blue-simple-icon-with-long-shadow.jpg?s=612x612&w=0&k=20&c=EQa9pV1fZEGfGCW_aEK5X_Gyob8YuRcOYCYZeuBzztM=","depositHistories":[],"collectionHistories":[],"_id":"63f85e50705601e9e6e003d9","firstName":"Victory","lastName":"Emmanuel","location":"string","email":"vicemmanuel7@gmail.com","phoneNumber":"08024391710","password":"$2b$12$aqQhqPJrl4H4IddSc7SEnueO28RDS/SYVbYyKsRUFZSmuWYRZ5LVm","passwordConfirm":"True","role":"user","histories":[],"createdAt":"2023-02-24T06:50:56.428Z","updatedAt":"2023-02-24T06:50:56.428Z","__v":0}

class Data {
  Data({
      this.user,});

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  User? user;
Data copyWith({  User? user,
}) => Data(  user: user ?? this.user,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

/// profileImage : "https://media.istockphoto.com/id/522855255/vector/male-profile-flat-blue-simple-icon-with-long-shadow.jpg?s=612x612&w=0&k=20&c=EQa9pV1fZEGfGCW_aEK5X_Gyob8YuRcOYCYZeuBzztM="
/// depositHistories : []
/// collectionHistories : []
/// _id : "63f85e50705601e9e6e003d9"
/// firstName : "Victory"
/// lastName : "Emmanuel"
/// location : "string"
/// email : "vicemmanuel7@gmail.com"
/// phoneNumber : "08024391710"
/// password : "$2b$12$aqQhqPJrl4H4IddSc7SEnueO28RDS/SYVbYyKsRUFZSmuWYRZ5LVm"
/// passwordConfirm : "True"
/// role : "user"
/// histories : []
/// createdAt : "2023-02-24T06:50:56.428Z"
/// updatedAt : "2023-02-24T06:50:56.428Z"
/// __v : 0

class User {
  User({
      this.profileImage, 
      this.depositHistories, 
      this.collectionHistories, 
      this.id, 
      this.firstName, 
      this.lastName, 
      this.location, 
      this.email, 
      this.phoneNumber, 
      this.password, 
      this.passwordConfirm, 
      this.role, 
      this.histories, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  User.fromJson(dynamic json) {
    profileImage = json['profileImage'];
    if (json['depositHistories'] != null) {
      depositHistories = [];
    }
    if (json['collectionHistories'] != null) {
      collectionHistories = [];
    }
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    location = json['location'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    passwordConfirm = json['passwordConfirm'];
    role = json['role'];
    if (json['histories'] != null) {
      histories = [];
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? profileImage;
  List<dynamic>? depositHistories;
  List<dynamic>? collectionHistories;
  String? id;
  String? firstName;
  String? lastName;
  String? location;
  String? email;
  String? phoneNumber;
  String? password;
  String? passwordConfirm;
  String? role;
  List<dynamic>? histories;
  String? createdAt;
  String? updatedAt;
  num? v;
User copyWith({  String? profileImage,
  List<dynamic>? depositHistories,
  List<dynamic>? collectionHistories,
  String? id,
  String? firstName,
  String? lastName,
  String? location,
  String? email,
  String? phoneNumber,
  String? password,
  String? passwordConfirm,
  String? role,
  List<dynamic>? histories,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => User(  profileImage: profileImage ?? this.profileImage,
  depositHistories: depositHistories ?? this.depositHistories,
  collectionHistories: collectionHistories ?? this.collectionHistories,
  id: id ?? this.id,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  location: location ?? this.location,
  email: email ?? this.email,
  phoneNumber: phoneNumber ?? this.phoneNumber,
  password: password ?? this.password,
  passwordConfirm: passwordConfirm ?? this.passwordConfirm,
  role: role ?? this.role,
  histories: histories ?? this.histories,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  v: v ?? this.v,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profileImage'] = profileImage;
    if (depositHistories != null) {
      map['depositHistories'] = depositHistories?.map((v) => v.toJson()).toList();
    }
    if (collectionHistories != null) {
      map['collectionHistories'] = collectionHistories?.map((v) => v.toJson()).toList();
    }
    map['_id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['location'] = location;
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['password'] = password;
    map['passwordConfirm'] = passwordConfirm;
    map['role'] = role;
    if (histories != null) {
      map['histories'] = histories?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}