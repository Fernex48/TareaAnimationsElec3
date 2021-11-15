import 'package:flutter/cupertino.dart';
import 'package:tienda_en_linea_diego/supermercado/supermercado_bloc.dart';

class SuperMercadoProvider extends InheritedWidget {
  final SuperMercadoBloc bloc;
  // ignore: annotate_overrides, overridden_fields
  final Widget child;

  // ignore: use_key_in_widget_constructors
  const SuperMercadoProvider({
    required this.bloc,
    required this.child,
  }) : super(child: child);

  static SuperMercadoProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SuperMercadoProvider>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
