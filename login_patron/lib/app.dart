import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_patron/repository/authentication_repository.dart';

class Login extends StatelessWidget {
  const Login({Key key, required authenticationRepository})
      : assert(authenticationRepository != null),
        super(key: key);

  final AuthenticationRepository authenticationRepository;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(),
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener(listener: (context, state) {});
      },
    );
  }
}
