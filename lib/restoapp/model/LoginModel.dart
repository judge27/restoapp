/// status : true
/// message : "تم تسجيل الدخول بنجاح"
/// data : {"id":57628,"name":"Mohamed","email":"msamii@gmail.com","phone":"01005666274","image":"https://student.valuxapps.com/storage/uploads/users/JV0HkyHK6k_1691703092.jpeg","points":0,"credit":0,"token":"HkDAqxSIbWujlCixxfPOCOsF7s8hc4Bv7rvsOhj8r6WtwRSm33YWwHz5wihif47eWg0ipt"}

class LoginModel {
  LoginModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  LoginModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;

  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : 57628
/// name : "Mohamed"
/// email : "msamii@gmail.com"
/// phone : "01005666274"
/// image : "https://student.valuxapps.com/storage/uploads/users/JV0HkyHK6k_1691703092.jpeg"
/// points : 0
/// credit : 0
/// token : "HkDAqxSIbWujlCixxfPOCOsF7s8hc4Bv7rvsOhj8r6WtwRSm33YWwHz5wihif47eWg0ipt"

class Data {
  Data({
      num? id, 
      String? name, 
      String? email, 
      String? phone, 
      String? image, 
      num? points, 
      num? credit, 
      String? token,}){
    _id = id;
    _name = name;
    _email = email;
    _phone = phone;
    _image = image;
    _points = points;
    _credit = credit;
    _token = token;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _image = json['image'];
    _points = json['points'];
    _credit = json['credit'];
    _token = json['token'];
  }
  num? _id;
  String? _name;
  String? _email;
  String? _phone;
  String? _image;
  num? _points;
  num? _credit;
  String? _token;

  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get phone => _phone;
  String? get image => _image;
  num? get points => _points;
  num? get credit => _credit;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['image'] = _image;
    map['points'] = _points;
    map['credit'] = _credit;
    map['token'] = _token;
    return map;
  }

}