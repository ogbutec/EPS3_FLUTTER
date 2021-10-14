import 'package:flutter/material.dart';
import 'package:cafesv/Principal/util/constantes.dart';
import 'package:meta/meta.dart';

final cafess = List.generate(
    _nombres.length,
    (index) => Cafe(
        imagen: 'assets/img/${index + 1}.png',
        nombre: _nombres[index],
        precio: _precios[index]));

class Cafe {
  final String nombre;
  final String imagen;
  final String precio;
  Cafe({
    required this.nombre,
    required this.imagen,
    required this.precio,
  });
}

final _precios = [
  '1.5',
  '2.0',
  '3.0',
  '1.25',
  '1.5',
  '2.0',
  '3.0',
  '1.25',
  '1.5',
  '2.0',
  '3.0',
  '1.25'
];
final _nombres = [
  'Expresso helado',
  'Schümli',
  'Cappuccino',
  'Caffè Corretto',
  'Caffè Mocca',
  'Latte Macchiato',
  'Caffè Latte',
  'Café au lait',
  'Café clásico de helado',
  'Cool Cappuccino',
  'Expresso Sorbeto',
  'Coffee Cobbler Bourbon'
];
