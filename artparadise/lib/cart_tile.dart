import 'package:flutter/material.dart';
import 'cart_item.dart';
import 'utils_services.dart';
import 'quantity_widget.dart';

class CartTile extends StatefulWidget {
  const CartTile({
    super.key,
    required this.cartItem,
    required this.remove,
  });

  final CartItem cartItem;
  final Function(CartItem) remove;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        //TITULO
        title: Text(
          widget.cartItem.product.name,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),

        //TOTAL
        subtitle: Text(
          utilsServices.priceToCurrency(
            widget.cartItem.totalPrice(),
          ),
          style: TextStyle(
            color: Colors.red.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),

        //QUANTIDADE
        trailing: QuantityWidget(
          value: widget.cartItem.quantity,
          sufixText: widget.cartItem.product.unit,
          result: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;

              //REMOVER DO CARRINHO
              if (quantity == 0) {
                widget.remove(widget.cartItem);
              }
            });
          },
          isRemoveble: true,
        ),
      ),
    );
  }
}
