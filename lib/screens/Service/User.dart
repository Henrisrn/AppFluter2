import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/screens/UserModel.dart';

class UserService {
  FirebaseAuth _fff = FirebaseAuth.instance;

  Stream<Usermodel> get user {
    return _fff.authStateChanges().asyncMap(
        (user) => Usermodel(uid: user!.uid, email: user.uid, pwd: user.uid));
  }

  Future<Usermodel> Auth(Usermodel usermm) async {
    UserCredential userCredentiall;
    print(usermm.toJson());
    try {
      userCredentiall = await _fff.signInWithEmailAndPassword(
          email: usermm.email, password: usermm.pwd);
      //UserCredential user = await _fff.signInAnonymously();
      //print(user.user);
    } catch (e) {
      if (usermm.email.length > 3) {
        userCredentiall = await _fff.createUserWithEmailAndPassword(
            email: usermm.email, password: usermm.pwd);
      } else {
        userCredentiall = await _fff.signInWithEmailAndPassword(
            email: "henrii.serrano@gmail.com", password: "123456");
      }
    }
    usermm.setUid = userCredentiall.user?.uid;
    return usermm;
  }
}
