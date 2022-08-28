class Usermodel {
  final String email;
  final String pwd;
  String uid;

  Usermodel({required this.uid, required this.email, required this.pwd});
  set setUid(value) => () {
        uid = value;
      };

  Map<String, dynamic> toJson() => {'uid': uid, 'pwd': pwd, "email": email};
}
