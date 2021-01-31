part of 'services.dart';

class AuthServices {
  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> selectedGenres, String selectedLanguage) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = result.user.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

      await UserServices.updateUser(user);

      return SignInSignUpResult(userModel: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      UserModel userModel = await result.user.fromFireStore();

      return SignInSignUpResult(userModel: userModel);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  static Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  static Stream<User> get userStream => _firebaseAuth.authStateChanges();
}

class SignInSignUpResult {
  final UserModel userModel;
  final String message;

  SignInSignUpResult({this.userModel, this.message});
}
