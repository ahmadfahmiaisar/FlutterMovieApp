import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'page_state.dart';

part 'page_event.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc(PageState initialState) : super(initialState);

  PageState get initialState => OnInitialPage();

  @override
  Stream<PageState> mapEventToState(PageEvent event) async* {
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoToLoginPage) {
      yield OnLoginPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage();
    }
  }
}
