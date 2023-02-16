class RegistrationSuccessModel {
  final String? firstName;
  final String? lastName;
  final String? location;
  final String? email;
  final String? phoneNumber;
  final String? password;
  final String? role;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final int? V;
  const RegistrationSuccessModel(
      {this.firstName,
      this.lastName,
      this.location,
      this.email,
      this.phoneNumber,
      this.password,
      this.role,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.V});
  RegistrationSuccessModel copyWith(
      {String? firstName,
      String? lastName,
      String? location,
      String? email,
      String? phoneNumber,
      String? password,
      String? role,
      String? id,
      String? createdAt,
      String? updatedAt,
      int? V}) {
    return RegistrationSuccessModel(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        location: location ?? this.location,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        role: role ?? this.role,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        V: V ?? this.V);
  }

  Map<String, Object?> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'location': location,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'role': role,
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'V': V
    };
  }

  static RegistrationSuccessModel fromJson(Map<String, Object?> json) {
    return RegistrationSuccessModel(
        firstName:
            json['firstName'] == null ? null : json['firstName'] as String,
        lastName: json['lastName'] == null ? null : json['lastName'] as String,
        location: json['location'] == null ? null : json['location'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        phoneNumber:
            json['phoneNumber'] == null ? null : json['phoneNumber'] as String,
        password: json['password'] == null ? null : json['password'] as String,
        role: json['role'] == null ? null : json['role'] as String,
        id: json['id'] == null ? null : json['id'] as String,
        createdAt:
            json['createdAt'] == null ? null : json['createdAt'] as String,
        updatedAt:
            json['updatedAt'] == null ? null : json['updatedAt'] as String,
        V: json['V'] == null ? null : json['V'] as int);
  }

  @override
  String toString() {
    return '''RegistrationSuccessModel(
                firstName:$firstName,
lastName:$lastName,
location:$location,
email:$email,
phoneNumber:$phoneNumber,
password:$password,
role:$role,
id:$id,
createdAt:$createdAt,
updatedAt:$updatedAt,
V:$V
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is RegistrationSuccessModel &&
        other.runtimeType == runtimeType &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.location == location &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.password == password &&
        other.role == role &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.V == V;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, firstName, lastName, location, email,
        phoneNumber, password, role, id, createdAt, updatedAt, V);
  }
}
