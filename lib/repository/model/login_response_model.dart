/// message : "Authorization successful"
/// id : "63f85e50705601e9e6e003d9"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZpY2VtbWFudWVsN0BnbWFpbC5jb20iLCJ1c2VySUQiOiI2M2Y4NWU1MDcwNTYwMWU5ZTZlMDAzZDkiLCJpYXQiOjE2Nzg0NTQyODQsImV4cCI6MTY3ODQ2MTQ4NH0.QaPfWchnVI4EY5-t_L0BErFj6vQ28JcX021YK0oSvNk"

class LoginResponseModel {
  LoginResponseModel({
      this.message, 
      this.id, 
      this.token,});

  LoginResponseModel.fromJson(dynamic json) {
    message = json['message'];
    id = json['id'];
    token = json['token'];
  }
  String? message;
  String? id;
  String? token;
LoginResponseModel copyWith({  String? message,
  String? id,
  String? token,
}) => LoginResponseModel(  message: message ?? this.message,
  id: id ?? this.id,
  token: token ?? this.token,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['id'] = id;
    map['token'] = token;
    return map;
  }

}