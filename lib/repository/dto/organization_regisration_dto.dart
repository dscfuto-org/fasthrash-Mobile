class OrganizationRegistrationDto {
  final String? businessName;
  final String? location;
  final String? size;
  final int? yearsOfOperation;
  final String? email;
  final String? password;
  const OrganizationRegistrationDto(
      {this.businessName,
      this.location,
      this.size,
      this.yearsOfOperation,
      this.email,
      this.password});
  OrganizationRegistrationDto copyWith(
      {String? businessName,
      String? location,
      String? size,
      int? yearsOfOperation,
      String? email,
      String? password}) {
    return OrganizationRegistrationDto(
        businessName: businessName ?? this.businessName,
        location: location ?? this.location,
        size: size ?? this.size,
        yearsOfOperation: yearsOfOperation ?? this.yearsOfOperation,
        email: email ?? this.email,
        password: password ?? this.password);
  }

  Map<String, Object?> toJson() {
    return {
      'businessName': businessName,
      'location': location,
      'size': size,
      'yearsOfOperation': yearsOfOperation,
      'email': email,
      'password': password
    };
  }

  static OrganizationRegistrationDto fromJson(Map<String, Object?> json) {
    return OrganizationRegistrationDto(
        businessName: json['businessName'] == null
            ? null
            : json['businessName'] as String,
        location: json['location'] == null ? null : json['location'] as String,
        size: json['size'] == null ? null : json['size'] as String,
        yearsOfOperation: json['yearsOfOperation'] == null
            ? null
            : json['yearsOfOperation'] as int,
        email: json['email'] == null ? null : json['email'] as String,
        password: json['password'] == null ? null : json['password'] as String);
  }

  @override
  String toString() {
    return '''OrganizationRegistrationDto(
                businessName:$businessName,
location:$location,
size:$size,
yearsOfOperation:$yearsOfOperation,
email:$email,
password:$password
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is OrganizationRegistrationDto &&
        other.runtimeType == runtimeType &&
        other.businessName == businessName &&
        other.location == location &&
        other.size == size &&
        other.yearsOfOperation == yearsOfOperation &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, businessName, location, size,
        yearsOfOperation, email, password);
  }
}
