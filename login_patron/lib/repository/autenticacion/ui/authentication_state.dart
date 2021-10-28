part of 'authentication_app.dart';

//import 'package:equatable/equatable.dart';

enum AuthenticationStatus { authenticated, unauthenticated, unkown }

class AuthenticationState extends Equatable {
  const AuthenticationState._(
      {this.status = AuthenticationStatus.unkown, this.user = User.empty});

  const AuthenticationState.unkown() : this._();

  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final User user;
  List<Object> get props => [status, user];
}
