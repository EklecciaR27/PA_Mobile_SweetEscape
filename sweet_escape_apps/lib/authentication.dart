import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> regis(String email, String password, String username) async {
    final user = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await user.user!.updateDisplayName(username);
  }

  Future<void> login(String email, String password) async {
    final user = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
