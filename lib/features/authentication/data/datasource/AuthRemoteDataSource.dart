import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectiot/features/authentication/data/models/user_model.dart';

abstract class AuthDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String email, String password);
  Future<void> sendVerificationEmail();
  Future<bool> verificationEmail();
  Future<void> resetPassword(String email);
  Future<void> logOut();
  Stream<UserModel?> authChangeState();
}

class AuthRemoteDataSource implements AuthDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserModel> login(String email, String password) async {
    UserCredential users = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel(uid: users.user!.uid, email: users.user!.email.toString());
  }

  @override
  Future<UserModel> register(String email, String password) async {
    UserCredential users = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel(uid: users.user!.uid, email: users.user!.email.toString());
  }

  @override
  Future<void> sendVerificationEmail() async {
    _firebaseAuth.currentUser!.sendEmailVerification();
  }

  @override
  Future<bool> verificationEmail() async {
    return _firebaseAuth.currentUser!.emailVerified;
  }

  @override
  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Stream<UserModel?> authChangeState() {
    return _firebaseAuth.authStateChanges().map(
      (map) => map != null && map.emailVerified
          ? UserModel(uid: map.uid, email: map.email.toString())
          : null,
    );
  }
}
