part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User firebaseUser = Provider.of<User>(context);
    if (firebaseUser == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        // ignore: deprecated_member_use
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        // ignore: deprecated_member_use
        context.bloc<UserBloc>().add(LoadUser(firebaseUser.uid));
        prevPageEvent = GoToMainPage();
        // ignore: deprecated_member_use
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    }
    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnLoginPage)
                ? SignInPage()
                : MainPage());
  }
}
