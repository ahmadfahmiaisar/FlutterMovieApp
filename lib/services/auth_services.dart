part of 'services.dart';

class AuthServices {
  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(String email, String password, String name,
      List<String> selectedGenres, String selectedLanguage) async {
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
}

class SignInSignUpResult {
  final UserModel userModel;
  final String message;

  SignInSignUpResult({this.userModel, this.message});
}
