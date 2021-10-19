import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Usuario extends Equatable {
  final String id;
  final String? email;
  final String? nombre;
  final String? foto;

  const Usuario({
    required this.email,
    required this.id,
    required this.nombre,
    required this.foto,
  })  : assert(email != null),
        assert(id != null);

  static const vacio = Usuario(email: '', id: '', nombre: '', foto: '');
  @override
  List<Object> get props => [email!, id, nombre!, foto!];
}
