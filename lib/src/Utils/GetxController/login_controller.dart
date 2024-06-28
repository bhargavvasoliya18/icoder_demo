import 'package:bhargav_practicle/src/Model/UserModel/user_model.dart';
import 'package:bhargav_practicle/src/Page/LoginScreen/login_screen.dart';
import 'package:bhargav_practicle/src/Page/TransactionsScreen/transactions_screen.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
 UserModel userModel = UserModel();
  Future<void> googleSignOut() => googleSignIn.disconnect();

  @override
  void onInit() {
    // user.bindStream(auth.authStateChanges());
    super.onInit();
  }

   signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(accessToken: googleSignInAuthentication.accessToken, idToken: googleSignInAuthentication.idToken,);
      if (googleSignInAccount.displayName != null && googleSignInAccount.displayName!.split(" ").length > 1) {
        userModel.firstName =  googleSignInAccount.displayName!.split(" ")[0];
        userModel.lastName = googleSignInAccount.displayName!.split(" ")[1];
      } else {
        userModel.firstName = googleSignInAccount.displayName!.split(" ")[0];
        userModel.lastName = "";
      }
      Get.offAll(const TransactionsScreen());
    }
  }


  void signOut() async {
    googleSignOut();
    // await auth.signOut();
    Get.offAll(LoginScreen());
  }
}
