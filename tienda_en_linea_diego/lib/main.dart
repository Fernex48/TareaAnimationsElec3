import 'package:flutter/material.dart';
import 'package:tienda_en_linea_diego/supermercado/supermercado_home.dart';

void main() {
  runApp(const SuperMercadoDiego());
}

class SuperMercadoDiego extends StatelessWidget {
  const SuperMercadoDiego({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const SupermercadoHome(),
    );
  }
}
