class RegistrationDto {
  RegistrationDto({
      this.firstName, 
      this.lastName, 
      this.location, 
      this.email, 
      this.phoneNumber, 
      this.password, 
      this.passwordConfirm, 
      this.role,});

  RegistrationDto.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    location = json['location'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    passwordConfirm = json['passwordConfirm'];
    role = json['role'];
  }
  String? firstName;
  String? lastName;
  String? location;
  String? email;
  String? phoneNumber;
  String? password;
  String? passwordConfirm;
  String? role;
RegistrationDto copyWith({  String? firstName,
  String? lastName,
  String? location,
  String? email,
  String? phoneNumber,
  String? password,
  String? passwordConfirm,
  String? role,
}) => RegistrationDto(  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  location: location ?? this.location,
  email: email ?? this.email,
  phoneNumber: phoneNumber ?? this.phoneNumber,
  password: password ?? this.password,
  passwordConfirm: passwordConfirm ?? this.passwordConfirm,
  role: role ?? this.role,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['location'] = location;
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['password'] = password;
    map['passwordConfirm'] = passwordConfirm;
    map['role'] = role;
    return map;
  }

}