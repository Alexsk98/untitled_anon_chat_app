import 'package:anon_chat/Screens/HomeScreen.dart';
import 'package:anon_chat/Screens/Login.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User?> _firebaseUser = FirebaseAuth.instance.currentUser.obs;

  String? get user => _firebaseUser.value?.email; 
  String? get uid => _firebaseUser.value?.uid;

  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("Error while signing in", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    await _auth.signOut();
  }

  void registerUser(String email, String password) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password)
    .catchError((onError) => Get.snackbar("error while creating account", onError.message));
  }

}