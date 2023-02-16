class LoginDto {
final String? email;
final String? password;
const LoginDto({this.email , this.password });
LoginDto copyWith({String? email, String? password}){
return LoginDto(
            email:email ?? this.email,
password:password ?? this.password
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'email': email,
'password': password
    };
}

static LoginDto fromJson(Map<String , Object?> json){
    return LoginDto(
            email:json['email'] == null ? null : json['email'] as String,
password:json['password'] == null ? null : json['password'] as String
    );
}

@override
String toString(){
    return '''LoginDto(
                email:$email,
password:$password
    ) ''';
}

@override
bool operator ==(Object other){
    return other is LoginDto && 
        other.runtimeType == runtimeType &&
        other.email == email && 
other.password == password;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                email, 
password
    );
}
    
}
      
      
  
     