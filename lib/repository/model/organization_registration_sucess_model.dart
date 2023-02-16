class OrganizationRegistrationSuccessModel {
  final String? businessName;
  final String? location;
  final String? size;
  final int? yearsOfOperation;
  final String? email;
  final String? password;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final int? V;
  const OrganizationRegistrationSuccessModel(
      {this.businessName,
      this.location,
      this.size,
      this.yearsOfOperation,
      this.email,
      this.password,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.V});
  OrganizationRegistrationSuccessModel copyWith(
      {String? businessName,
      String? location,
      String? size,
      int? yearsOfOperation,
      String? email,
      String? password,
      String? id,
      String? createdAt,
      String? updatedAt,
      int? V}) {
    return OrganizationRegistrationSuccessModel(
        businessName: businessName ?? this.businessName,
        location: location ?? this.location,
        size: size ?? this.size,
        yearsOfOperation: yearsOfOperation ?? this.yearsOfOperation,
        email: email ?? this.email,
        password: password ?? this.password,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        V: V ?? this.V);
  }

  Map<String, Object?> toJson() {
    return {
      'businessName': businessName,
      'location': location,
      'size': size,
      'yearsOfOperation': yearsOfOperation,
      'email': email,
      'password': password,
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'V': V
    };
  }

  static OrganizationRegistrationSuccessModel fromJson(
      Map<String, Object?> json) {
    return OrganizationRegistrationSuccessModel(
        businessName: json['businessName'] == null
            ? null
            : json['businessName'] as String,
        location: json['location'] == null ? null : json['location'] as String,
        size: json['size'] == null ? null : json['size'] as String,
        yearsOfOperation: json['yearsOfOperation'] == null
            ? null
            : json['yearsOfOperation'] as int,
        email: json['email'] == null ? null : json['email'] as String,
        password: json['password'] == null ? null : json['password'] as String,
        id: json['id'] == null ? null : json['id'] as String,
        createdAt:
            json['createdAt'] == null ? null : json['createdAt'] as String,
        updatedAt:
            json['updatedAt'] == null ? null : json['updatedAt'] as String,
        V: json['V'] == null ? null : json['V'] as int);
  }

  @override
  String toString() {
    return '''OrganizationRegistrationSuccessModel(
                businessName:$businessName,
location:$location,
size:$size,
yearsOfOperation:$yearsOfOperation,
email:$email,
password:$password,
id:$id,
createdAt:$createdAt,
updatedAt:$updatedAt,
V:$V
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is OrganizationRegistrationSuccessModel &&
        other.runtimeType == runtimeType &&
        other.businessName == businessName &&
        other.location == location &&
        other.size == size &&
        other.yearsOfOperation == yearsOfOperation &&
        other.email == email &&
        other.password == password &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.V == V;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, businessName, location, size,
        yearsOfOperation, email, password, id, createdAt, updatedAt, V);
  }
}
