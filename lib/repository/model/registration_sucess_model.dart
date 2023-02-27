class RegistrationSuccessModel {
  RegistrationSuccessModel({
      Message? message,}){
    _message = message;
}

  RegistrationSuccessModel.fromJson(dynamic json) {
    _message = json['message'] != null ? Message.fromJson(json['message']) : null;
  }
  Message? _message;
RegistrationSuccessModel copyWith({  Message? message,
}) => RegistrationSuccessModel(  message: message ?? _message,
);
  Message? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_message != null) {
      map['message'] = _message?.toJson();
    }
    return map;
  }

}

class Message {
  Message({
      String? firstName, 
      String? lastName, 
      String? location, 
      String? email, 
      String? phoneNumber, 
      String? password, 
      String? passwordConfirm, 
      String? role, 
      List<dynamic>? histories, 
      String? id, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _firstName = firstName;
    _lastName = lastName;
    _location = location;
    _email = email;
    _phoneNumber = phoneNumber;
    _password = password;
    _passwordConfirm = passwordConfirm;
    _role = role;
    _histories = histories;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  Message.fromJson(dynamic json) {
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _location = json['location'];
    _email = json['email'];
    _phoneNumber = json['phoneNumber'];
    _password = json['password'];
    _passwordConfirm = json['passwordConfirm'];
    _role = json['role'];
    if (json['histories'] != null) {
      _histories = [];
      json['histories'].forEach((v) {
        // _histories?.add(Dynamic.fromJson(v));
      });
    }
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _firstName;
  String? _lastName;
  String? _location;
  String? _email;
  String? _phoneNumber;
  String? _password;
  String? _passwordConfirm;
  String? _role;
  List<dynamic>? _histories;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
Message copyWith({  String? firstName,
  String? lastName,
  String? location,
  String? email,
  String? phoneNumber,
  String? password,
  String? passwordConfirm,
  String? role,
  List<dynamic>? histories,
  String? id,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => Message(  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  location: location ?? _location,
  email: email ?? _email,
  phoneNumber: phoneNumber ?? _phoneNumber,
  password: password ?? _password,
  passwordConfirm: passwordConfirm ?? _passwordConfirm,
  role: role ?? _role,
  histories: histories ?? _histories,
  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get location => _location;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;
  String? get password => _password;
  String? get passwordConfirm => _passwordConfirm;
  String? get role => _role;
  List<dynamic>? get histories => _histories;
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['location'] = _location;
    map['email'] = _email;
    map['phoneNumber'] = _phoneNumber;
    map['password'] = _password;
    map['passwordConfirm'] = _passwordConfirm;
    map['role'] = _role;
    if (_histories != null) {
      map['histories'] = _histories?.map((v) => v.toJson()).toList();
    }
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}