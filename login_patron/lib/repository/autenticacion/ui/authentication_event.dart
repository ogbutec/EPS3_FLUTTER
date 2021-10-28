part of 'authentication_app.dart';

abstract class AuthenticationEvent extends Equatable {
  List<Object> get prop => [];
}

abstract class AuthenticationUserChanged extends AuthenticationEvent {
  AuthenticationUserChanged(this.user);
  User user;
  List<Object> get prop => [user];
}

abstract class AuthenticationLogoutRequested extends AuthenticationEvent {}
