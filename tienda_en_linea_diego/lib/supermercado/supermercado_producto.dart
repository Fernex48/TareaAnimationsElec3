class SuperMercadoProduct {
  const SuperMercadoProduct({
    required this.price,
    required this.name,
    required this.description,
    required this.image,
  });
  final double price;
  final String name;
  final String description;
  final String image;
}

const mercadoProducts = <SuperMercadoProduct>{
  //Deben haber al menos 10 productos
  SuperMercadoProduct(
    price: 4.37,
    name: 'Leche',
    description: 'Galón de leche entera marca Doña Laura',
    image: 'assets/img/leche.jpg',
  ),
  SuperMercadoProduct(
    price: 2.47,
    name: 'Arroz',
    description: 'Arroz blanco OMOA 4 Libras',
    image: 'assets/img/arroz.jpg',
  ),
  SuperMercadoProduct(
    price: 0.92,
    name: 'Frijoles',
    description: 'Frijoles rojos volteados Doypack 400 gramos',
    image: 'assets/img/frijoles.jpg',
  ),
  SuperMercadoProduct(
    price: 1.23,
    name: 'Jamón',
    description: 'Jamón de pavo Toledo 230 gramos',
    image: 'assets/img/jamon.jpg',
  ),
  SuperMercadoProduct(
    price: 1.99,
    name: 'Pan integral',
    description:
        'Pan integral 100% grano entero, alto en fibra sin grasa trans con tan solo 73 kcal por rebanada',
    image: 'assets/img/pan.jpg',
  ),
  SuperMercadoProduct(
    price: 2.15,
    name: 'Atún',
    description: 'Atún en vegetales Sardimar 140 gramos',
    image: 'assets/img/atun.jpg',
  ),
  SuperMercadoProduct(
    price: 0.95,
    name: 'Tomates',
    description: 'Libra de tomate de cocina',
    image: 'assets/img/tomate.jpg',
  ),
  SuperMercadoProduct(
    price: 3.69,
    name: 'Comida para gato',
    description: 'Comida para gato Alimiau de pescado 3.3 libras',
    image: 'assets/img/comidagato.jpg',
  ),
  SuperMercadoProduct(
    price: 2.25,
    name: 'Jabón de baño',
    description: '3-pack 330 gramos Jabón antibacterial Protex vitamina E',
    image: 'assets/img/jabonprotex.jpg',
  ),
  SuperMercadoProduct(
    price: 5.60,
    name: 'Detergente',
    description: 'Detergente en polvo fuerza solar UltraKlin 5 KG',
    image: 'assets/img/detergente.jpg',
  ),
};
