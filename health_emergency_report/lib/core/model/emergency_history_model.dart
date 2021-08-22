
class EmergencyHistoryModel {
  bool? status;
  String? createdAt;
  String? id;
  String? uid;
  User? user;
  String? lat;
  String? lng;
  String? address;
  String? title;
  String? description;
  String? timestamp;

  EmergencyHistoryModel({this.status, this.createdAt, this.id, this.uid, this.user, this.lat, this.lng, this.address, this.title, this.description, this.timestamp});

  EmergencyHistoryModel.fromJson(Map<String, dynamic> json) {
    this.status = json["status"];
    this.createdAt = json["created_at"];
    this.id = json["_id"];
    this.uid = json["uid"];
    this.user = json["user"] == null ? null : User.fromJson(json["user"]);
    this.lat = json["lat"];
    this.lng = json["lng"];
    this.address = json["address"];
    this.title = json["title"];
    this.description = json["description"];
    this.timestamp = json["timestamp"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status"] = this.status;
    data["created_at"] = this.createdAt;
    data["_id"] = this.id;
    data["uid"] = this.uid;
    if(this.user != null)
      data["user"] = this.user!.toJson();
    data["lat"] = this.lat;
    data["lng"] = this.lng;
    data["address"] = this.address;
    data["title"] = this.title;
    data["description"] = this.description;
    data["timestamp"] = this.timestamp;
    return data;
  }
}

class User {
  bool? isAdmin;
  String? department;
  String? level;
  String? profileUrl;
  String? resetPasswordToken;
  String? id;
  String? fullName;
  String? phone;
  String? matric;
  String? password;
  String? hostel;

  User({this.isAdmin, this.department, this.level, this.profileUrl, this.resetPasswordToken, this.id, this.fullName, this.phone, this.matric, this.password, this.hostel});

  User.fromJson(Map<String, dynamic> json) {
    this.isAdmin = json["isAdmin"];
    this.department = json["department"];
    this.level = json["level"];
    this.profileUrl = json["profile_url"];
    this.resetPasswordToken = json["resetPasswordToken"];
    this.id = json["_id"];
    this.fullName = json["fullName"];
    this.phone = json["phone"];
    this.matric = json["matric"];
    this.password = json["password"];
    this.hostel = json["hostel"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["isAdmin"] = this.isAdmin;
    data["department"] = this.department;
    data["level"] = this.level;
    data["profile_url"] = this.profileUrl;
    data["resetPasswordToken"] = this.resetPasswordToken;
    data["_id"] = this.id;
    data["fullName"] = this.fullName;
    data["phone"] = this.phone;
    data["matric"] = this.matric;
    data["password"] = this.password;
    data["hostel"] = this.hostel;
    return data;
  }
}