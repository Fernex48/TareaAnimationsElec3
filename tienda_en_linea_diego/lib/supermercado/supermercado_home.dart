// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:tienda_en_linea_diego/supermercado/supermercado_bloc.dart';
import 'package:tienda_en_linea_diego/supermercado/supermercado_cart.dart';
import 'package:tienda_en_linea_diego/supermercado/supermercado_list.dart';
import 'package:tienda_en_linea_diego/supermercado/supermercado_provider.dart';

//Constantes necesarias
//Para el color de fondo
const backgroundColor = Color(0xFFF6F5F2);
//Para el alto necesario para calcular el tamaño que usarán las divisiones
//De la pantalla
const cartBarHeight = 100.0;
//Para la duración de la animación entre paneles
const _panelTransition = Duration(milliseconds: 500);

//Clase para el menú de la app
//Contiene un panel blanco grande con el listado de productos
//Y un panel negro para la vista previa del carrito de compras
class SupermercadoHome extends StatefulWidget {
  const SupermercadoHome({Key? key}) : super(key: key);

  @override
  State<SupermercadoHome> createState() => _SupermercadoHomeState();
}

class _SupermercadoHomeState extends State<SupermercadoHome> {
  final bloc = SuperMercadoBloc();

  void _onVerticalGesture(DragUpdateDetails details) {
    // ignore: avoid_print
    if (details.primaryDelta! < -7) {
      bloc.changeToCart();
    } else if (details.primaryDelta! > 12) {
      bloc.changeToNormal();
    }
  }

  //Método para obtener el alto del panel blanco al deslizar hacia arriba
  double _getTopForWhitePanel(MercadoState state, Size size) {
    double newSize = 0.0;
    if (state == MercadoState.normal) {
      newSize = -cartBarHeight + kToolbarHeight;
    } else if (state == MercadoState.cart) {
      newSize = -(size.height - kToolbarHeight - cartBarHeight / 2);
    }
    return newSize;
  }

  //Método para obtener el alto del panel blanco al deslizar hacia abajo
  double _getTopForBlackPanel(MercadoState state, Size size) {
    double newSize = 0.0;
    if (state == MercadoState.normal) {
      newSize = size.height - cartBarHeight;
    } else if (state == MercadoState.cart) {
      newSize = cartBarHeight / 2;
    }
    return newSize;
  }

//Método para obtener el alto del panel blanco al deslizar hacia abajo
  double _getTopForAppBar(MercadoState state) {
    double newSize = 0.0;
    if (state == MercadoState.normal) {
      newSize = 0.0;
    } else if (state == MercadoState.cart) {
      newSize = -cartBarHeight;
    }
    return newSize;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SuperMercadoProvider(
      bloc: bloc,
      child: AnimatedBuilder(
        animation: bloc,
        builder: (context, _) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                AnimatedPositioned(
                  duration: _panelTransition,
                  curve: Curves.decelerate,
                  left: 0,
                  right: 0,
                  top: _getTopForWhitePanel(bloc.mercadoState, size),
                  height: size.height - kToolbarHeight,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(
                        30,
                      ),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: const SuperMercadoList(),
                    ),
                  ),
                ),
                //Panel negro
                AnimatedPositioned(
                  duration: _panelTransition,
                  curve: Curves.decelerate,
                  left: 0,
                  right: 0,
                  top: _getTopForBlackPanel(bloc.mercadoState, size),
                  height: size.height - kToolbarHeight,
                  child: GestureDetector(
                    onVerticalDragUpdate: _onVerticalGesture,
                    child: Container(
                      color: Colors.black,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: AnimatedSwitcher(
                              duration: _panelTransition,
                              child: SizedBox(
                                height: 15 + kToolbarHeight,
                                child: bloc.mercadoState == MercadoState.normal
                                    ? Row(
                                        children: [
                                          const Text(
                                            "Carrito",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            ),
                                          ),
                                          Expanded(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Row(
                                                  children: List.generate(
                                                    bloc.cart.length,
                                                    (index) => Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: Stack(
                                                        children: [
                                                          Hero(
                                                            tag:
                                                                'list_${bloc.cart[index].product.name}details',
                                                            child: CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.white,
                                                              backgroundImage:
                                                                  AssetImage(
                                                                bloc
                                                                    .cart[index]
                                                                    .product
                                                                    .image,
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: 0,
                                                            child: CircleAvatar(
                                                              radius: 10,
                                                              backgroundColor:
                                                                  Colors.red,
                                                              child: Text(
                                                                  bloc
                                                                      .cart[
                                                                          index]
                                                                      .quantity
                                                                      .toString(),
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  )),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.orange,
                                            child: Text(
                                              bloc
                                                  .totalCartElements()
                                                  .toString(),
                                            ),
                                          )
                                        ],
                                      )
                                    : const SizedBox.shrink(),
                              ),
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          Expanded(
                            // ignore: prefer_const_constructors
                            child: SuperMercadoCart(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  curve: Curves.decelerate,
                  duration: _panelTransition,
                  left: 0,
                  right: 0,
                  top: _getTopForAppBar(bloc.mercadoState),
                  child: const _AppBarSuper(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

//Widget para la creación de un APPBAR personalizado
class _AppBarSuper extends StatelessWidget {
  const _AppBarSuper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: kToolbarHeight,
        color: backgroundColor,
        child: Row(
          children: [
            const SizedBox(width: 30),
            const Expanded(
              child: Text(
                "SuperTienda: Pedido en línea",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ));
  }
}
