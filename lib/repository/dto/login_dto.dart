class LoginDto {
  LoginDto({
      this.email, 
      this.password,});

  LoginDto.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }
  String? email;
  String? password;
LoginDto copyWith({  String? email,
  String? password,
}) => LoginDto(  email: email ?? this.email,
  password: password ?? this.password,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }

}