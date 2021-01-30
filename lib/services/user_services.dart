part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(UserModel userModel) async {
    _userCollection.doc(userModel.id).set({
      'email': userModel.email,
      'name': userModel.name,
      'balance': userModel.balance,
      'selectedGenres': userModel.selectedGenres,
      'selectedLanguage': userModel.selectedLanguage,
      'profilePicture': userModel.profilePicture ?? ""
    });
  }

  static Future<UserModel> getUser(String id) async {
    DocumentSnapshot documentSnapshot = await _userCollection.doc(id).get();

    return UserModel(id, documentSnapshot.get('email'),
        balance: documentSnapshot.get('balance'),
        profilePicture: documentSnapshot.get('profilePicture'),
        selectedGenres: (documentSnapshot.get('selectedGenres') as List)
            .map((e) => e.toString())
            .toList(),
        selectedLanguage: documentSnapshot.get('selectedLanguage'),
        name: documentSnapshot.get('name'));
  }
}
