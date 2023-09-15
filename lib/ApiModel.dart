/// id : 16
/// name : "Akmaljon1016"
/// email : "akmaljonsotvoldiev1998@gmail.com"
/// password : "1234567"
/// phone : "+998916574373"

List<ApiModel> listFromJson(dynamic json){
  return List<ApiModel>.from(json.map((e)=>ApiModel.fromJson(e)));
}

class ApiModel {
  ApiModel({
      int? id, 
      String? name, 
      String? email, 
      String? password, 
      String? phone,}){
    _id = id;
    _name = name;
    _email = email;
    _password = password;
    _phone = phone;
}

  ApiModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _phone = json['phone'];
  }
  int? _id;
  String? _name;
  String? _email;
  String? _password;
  String? _phone;

  int? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['phone'] = _phone;
    return map;
  }

}