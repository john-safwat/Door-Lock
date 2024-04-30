
class MyUser {
  String uid;
  String name;
  String email;
  String password;
  String image;

  MyUser(
      {required this.uid,
      required this.name,
      required this.email,
      required this.password,
      required this.image,});

  MyUser.fromFireStore(Map<String, dynamic> json)
      : this(
          uid: json["uid"],
          name: json["name"],
          email: json["email"],
          password: json["password"],
          image: json["image"],
        );

  Map<String, dynamic> toFireStore() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "password": password,
      "image": image,
    };
  }
}
