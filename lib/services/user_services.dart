part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(UserModel userModel) async {
    _userCollection.doc(userModel.id).set({
      'email' : userModel.email,
      'name' : userModel.name,
      'balance' : userModel.balance,
      'selectedGenres' : userModel.selectedGenres,
      'selectedLanguage' : userModel.selectedLanguage,
      'profilePicture': userModel.profilePicture ?? ""
    });
  }
}
