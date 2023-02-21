class RegistrationDto {
  late  String? firstName;
  late  String? lastName;
  late  String? location;
  late  String? email;
  late  String? phoneNumber;
  late  String? password;
  late  String? role;
  RegistrationDto(
      {this.firstName,
      this.lastName,
      this.location,
      this.email,
      this.phoneNumber,
      this.password,
      this.role});
  RegistrationDto copyWith(
      {String? firstName,
      String? lastName,
      String? location,
      String? email,
      String? phoneNumber,
      String? password,
      String? role}) {
    return RegistrationDto(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        location: location ?? this.location,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        role: role ?? this.role);
  }

  Map<String, Object?> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'location': location,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'role': role
    };
  }

  static RegistrationDto fromJson(Map<String, Object?> json) {
    return RegistrationDto(
        firstName:
            json['firstName'] == null ? null : json['firstName'] as String,
        lastName: json['lastName'] == null ? null : json['lastName'] as String,
        location: json['location'] == null ? null : json['location'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        phoneNumber:
            json['phoneNumber'] == null ? null : json['phoneNumber'] as String,
        password: json['password'] == null ? null : json['password'] as String,
        role: json['role'] == null ? null : json['role'] as String);
  }

  @override
  String toString() {
    return '''RegistrationDto(
                firstName:$firstName,
lastName:$lastName,
location:$location,
email:$email,
phoneNumber:$phoneNumber,
password:$password,
role:$role
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is RegistrationDto &&
        other.runtimeType == runtimeType &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.location == location &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.password == password &&
        other.role == role;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, firstName, lastName, location, email,
        phoneNumber, password, role);
  }
}
