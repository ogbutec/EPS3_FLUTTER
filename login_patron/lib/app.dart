import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_patron/repository/autenticacion/authentication_repository.dart';
import 'package:login_patron/repository/autenticacion/ui/authentication_app.dart';
import 'package:login_patron/repository/autenticacion/ui/login/login_page.dart';
import 'package:login_patron/repository/autenticacion/ui/splash/splash_page.dart';
import 'package:login_patron/repository/theme.dart';

class Login extends StatelessWidget {
  const Login({required Key key, required this.authenticationRepository})
      : assert(authenticationRepository != null),
        super(key: key);

  final AuthenticationRepository authenticationRepository;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
            authenticationRepository: authenticationRepository),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  Navigator get _navigator => _navigatorKey.currentState;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUtil<void>(
 LoginPage.route(),
                  (route)=>true

                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUtil<void>(
                  LoginPage.route(),
                  (route)=>false
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_)=> SplashPage.route()//splash
    );
  }
}
