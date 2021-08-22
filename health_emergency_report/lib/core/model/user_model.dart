class UserModel {
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
  String? token;
  UserModel({
    this.isAdmin,
    this.department,
    this.level,
    this.profileUrl,
    this.resetPasswordToken,
    this.id,
    this.fullName,
    this.phone,
    this.matric,
    this.password,
    this.hostel,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
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
    this.token = json["token"];
  }
}
