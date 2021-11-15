import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:tienda_en_linea_diego/supermercado/supermercado_producto.dart';

//Lista enumerada para los estados en los que se puede encontrar la pantalla
enum MercadoState {
  normal,
  details,
  cart,
}

//Clase con los métodos para cambiar de estado a estado
class SuperMercadoBloc with ChangeNotifier {
  MercadoState mercadoState = MercadoState.normal;
  List<SuperMercadoProduct> catalog = List.unmodifiable(mercadoProducts);
  List<SuperMercadoProductItem> cart = [];

  //Cambiar a estado normal (el menú)
  void changeToNormal() {
    mercadoState = MercadoState.normal;
    notifyListeners();
  }

  //Cambiar a estado cart (el carrito de compras)
  void changeToCart() {
    mercadoState = MercadoState.cart;
    notifyListeners();
  }

  void deleteProduct(SuperMercadoProductItem productItem) {
    cart.remove(productItem);
    notifyListeners();
  }

  void addProduct(SuperMercadoProduct product) {
    for (SuperMercadoProductItem item in cart) {
      if (item.product.name == product.name) {
        item.increment();
        notifyListeners();
        return;
      }
    }

    cart.add(SuperMercadoProductItem(product: product));
    notifyListeners();
  }

  int totalCartElements() => cart.fold<int>(
      0, (previousValue, element) => previousValue + element.quantity);

  double totalPriceElements() => cart.fold<double>(
        0.0,
        (previousValue, element) =>
            previousValue + (element.quantity * element.product.price),
      );
}

class SuperMercadoProductItem {
  SuperMercadoProductItem({this.quantity = 1, required this.product});

  int quantity;
  final SuperMercadoProduct product;

  void increment() {
    quantity++;
  }

  void decrement() {}
}
