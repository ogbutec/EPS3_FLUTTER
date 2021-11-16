import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_patron/repository/repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:pedantic/pedantic.dart';

part 'authentication_state.dart';
part 'authentication_event.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(AuthenticationState.unkown()) {
    _userSubscription = _authenticationRepository.usuario
        .listen((usuario) => add(AuthenticationUserChanged(usuario)));
  }

  final AuthenticationRepository _authenticationRepository;
  // ignore: unused_field
  StreamSubscription<Usuario> _userSubscription;

  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationUserChanged) {
      yield _mapAuthenticationUserChangedToState(event);
    } else if (event is AuthenticationLogoutRequested) {
      unawaited(_authenticationRepository.logOut());
    }
  }

  AuthenticationState _mapAuthenticationUserChangedToState(
      AuthenticationUserChanged event) {
    return event.user != Usuario.vacio
        ? AuthenticationState.authenticated(event.user)
        : AuthenticationState.unauthenticated();
  }

  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
