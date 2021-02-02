import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/models/models.dart';
import 'package:movie_app_flutter/services/services.dart';

part 'user_state.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(UserState initialState) : super(initialState);

  UserState get initalState => UserInitial();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is LoadUser) {
      UserModel userModel = await UserServices.getUser(event.id);
      yield UserLoaded(userModel);
    } else if (event is SignOut) {
      yield UserInitial();
    }
  }
}
