import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/bloc/blocs.dart';
import 'package:movie_app_flutter/bloc/user/user_bloc.dart';
import 'package:movie_app_flutter/services/services.dart';
import 'package:movie_app_flutter/ui/pages/pages.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PageBloc(OnInitialPage())),
          BlocProvider(create: (_) => UserBloc(UserInitial()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
        ),
      ),
    );
  }
}
