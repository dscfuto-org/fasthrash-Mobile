class LoginSuccessModel {
final String? message;
final String? id;
final String? token;
const LoginSuccessModel({this.message , this.id , this.token });
LoginSuccessModel copyWith({String? message, String? id, String? token}){
return LoginSuccessModel(
            message:message ?? this.message,
id:id ?? this.id,
token:token ?? this.token
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'message': message,
'id': id,
'token': token
    };
}

static LoginSuccessModel fromJson(Map<String , Object?> json){
    return LoginSuccessModel(
            message:json['message'] == null ? null : json['message'] as String,
id:json['id'] == null ? null : json['id'] as String,
token:json['token'] == null ? null : json['token'] as String
    );
}

@override
String toString(){
    return '''LoginSucessModel(
                message:$message,
id:$id,
token:$token
    ) ''';
}

@override
bool operator ==(Object other){
    return other is LoginSuccessModel &&
        other.runtimeType == runtimeType &&
        other.message == message && 
other.id == id && 
other.token == token;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                message, 
id, 
token
    );
}
    
}
      
      
  
     