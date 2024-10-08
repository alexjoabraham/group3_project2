class Product {
  final String image;
  final String name;
  final String desc;
  final String longDesc;
  final String fragrance;
  final double price;

  Product({
    required this.name,
    required this.desc,
    required this.longDesc,
    required this.fragrance,
    required this.price,
    required this.image,
  });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}