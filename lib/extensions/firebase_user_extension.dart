part of 'extensions.dart';

extension FirebaseUserExtension on User {
  UserModel convertToUser(
          {String name = "No Name",
          List<String> selectedGenres = const [],
          String selectedLanguage = "English",
          int balance = 50000}) =>
      UserModel(this.uid, this.email,
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage,
          balance: balance);
}
