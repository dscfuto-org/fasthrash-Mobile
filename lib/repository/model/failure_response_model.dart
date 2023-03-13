/// status : 0
/// message : "scaled_1000000018.jpg was rejected. Please verify that your plastic waste is acceptable for recycling."
/// data : {"results":{"scaled_1000000018.jpg":false}}

class FailureResponseModel {
  FailureResponseModel({
      this.status, 
      this.message, 
      this.data,});

  FailureResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  dynamic status;
  String? message;
  Data? data;
FailureResponseModel copyWith({  dynamic status,
  String? message,
  Data? data,
}) => FailureResponseModel(  status: status ?? this.status,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// results : {"scaled_1000000018.jpg":false}

class Data {
  Data({
      this.results,});

  Data.fromJson(dynamic json) {
    results = json['results'] != null ? Results.fromJson(json['results']) : null;
  }
  Results? results;
Data copyWith({  Results? results,
}) => Data(  results: results ?? this.results,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (results != null) {
      map['results'] = results?.toJson();
    }
    return map;
  }

}

/// scaled_1000000018.jpg : false

class Results {
  Results({
      this.scaled1000000018jpg,});

  Results.fromJson(dynamic json) {
    scaled1000000018jpg = json['scaled_1000000018.jpg'];
  }
  bool? scaled1000000018jpg;
Results copyWith({  bool? scaled1000000018jpg,
}) => Results(  scaled1000000018jpg: scaled1000000018jpg ?? this.scaled1000000018jpg,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['scaled_1000000018.jpg'] = scaled1000000018jpg;
    return map;
  }

}