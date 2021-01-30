import 'package:flutter/material.dart';
import 'package:movie_app_flutter/services/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text("Sign Up"),
                  onPressed: () async {
                    SignInSignUpResult result = await AuthServices.signUp(
                        "fahmiaisar99@gmail.com",
                        "123456",
                        "Ahmad Fahmi Aisar",
                        ["Action", "Romantic", "Music"],
                        "Indonesia");

                    if (result.userModel == null) {
                      print(result.message);
                    } else {
                      print(result.userModel.toString());
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
