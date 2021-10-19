import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_patron/repository/autenticacion/modelo/user.dart';
import 'package:meta/meta.dart';
import 'package:login_patron/repository/autenticacion/modelo/user.dart';

//Error al registrarse

class SignUpFailure implements Exception {}

// Error en el login

class LogInWithEmailAndPasswordFailure implements Exception {}

// Error validacion Google
class LogInWithGoogleFailure implements Exception {}

//Errero al cerra sesion
class LogOutFailure implements Exception {}

//Autenticacion de sitio

class AuthenticationRepository {
  final firebase_auth.FirebaseAuth _firebaseauth;
  final GoogleSignIn _googleSignIn;

  AuthenticationRepository(
      {required firebase_auth.FirebaseAuth firebaseAuth,
      required GoogleSignIn googleSignIn})
      : _firebaseauth = firebaseAuth,
        _googleSignIn = googleSignIn;

  Stream<Usuario> get usuario {
    return _firebaseauth.authStateChanges().map((firebaseUsuario) {
      return firebaseUsuario == null
          ? Usuario.vacio
          : firebaseUsuario.toUsuario;
    });
  }

  //Registro usuario con correo y password
  Future<void> singUp(
      {required String correo, required String password}) async {
    assert(correo != null && password != null);
    try {
      await _firebaseauth.createUserWithEmailAndPassword(
          email: correo, password: password);
    } on Exception {
      throw SignUpFailure();
    }
  }

//Login con google
  Future<void> logInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final credential = firebase_auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await _firebaseauth.signInWithCredential(credential);
    } on Exception {
      throw LogInWithGoogleFailure();
    }
  }

//login con correo y password

//cerrar sesion

}

extension on firebase_auth.User {
  Usuario get toUsuario {
    return Usuario(id: uid, email: email, nombre: displayName, foto: photoURL);
  }
}
