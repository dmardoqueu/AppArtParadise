import 'cadastrar_produto.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  double totalPrice() => product.value * quantity;
}
