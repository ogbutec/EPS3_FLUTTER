part of 'authentication_app.dart';

abstract class AuthenticationEvent extends Equatable {
  List<Object> get prop => [];
}

class AuthenticationUserChanged extends AuthenticationEvent {
  AuthenticationUserChanged(this.user);
  User user;
  List<Object> get prop => [user];

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

abstract class AuthenticationLogoutRequested extends AuthenticationEvent {}
