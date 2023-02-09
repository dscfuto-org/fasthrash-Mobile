class LoginSucessModel {
final String? message;
final String? id;
final String? token;
const LoginSucessModel({this.message , this.id , this.token });
LoginSucessModel copyWith({String? message, String? id, String? token}){
return LoginSucessModel(
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

static LoginSucessModel fromJson(Map<String , Object?> json){
    return LoginSucessModel(
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
    return other is LoginSucessModel && 
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
      
      
  
     