class AlertsDto {
final String? title;
final String? description;
final String? image;
final String? location;
final int? quantity;
const AlertsDto({this.title , this.description , this.image , this.location , this.quantity });
AlertsDto copyWith({String? title, String? description, String? image, String? location, int? quantity}){
return AlertsDto(
            title:title ?? this.title,
description:description ?? this.description,
image:image ?? this.image,
location:location ?? this.location,
quantity:quantity ?? this.quantity
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'title': title,
'description': description,
'image': image,
'location': location,
'quantity': quantity
    };
}

static AlertsDto fromJson(Map<String , Object?> json){
    return AlertsDto(
            title:json['title'] == null ? null : json['title'] as String,
description:json['description'] == null ? null : json['description'] as String,
image:json['image'] == null ? null : json['image'] as String,
location:json['location'] == null ? null : json['location'] as String,
quantity:json['quantity'] == null ? null : json['quantity'] as int
    );
}

@override
String toString(){
    return '''AlertsDto(
                title:$title,
description:$description,
image:$image,
location:$location,
quantity:$quantity
    ) ''';
}

@override
bool operator ==(Object other){
    return other is AlertsDto && 
        other.runtimeType == runtimeType &&
        other.title == title && 
other.description == description && 
other.image == image && 
other.location == location && 
other.quantity == quantity;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                title, 
description, 
image, 
location, 
quantity
    );
}
    
}
      
      
  
     