class UserData {
  late final String username;
  late final String id;
  late final String name;
  late final String department;
  late final String role;
  late final String token;
  late final String tokenExpire;
  late final String image;

  UserData.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    id = json['id'];
    name = json['name'];
    department = json['department'];
    role = json['role'];
    token = json['token'];
    tokenExpire = json['token_expire'];
    image = json['image_url']?? "assets/images/image_man.png";
  }
}
