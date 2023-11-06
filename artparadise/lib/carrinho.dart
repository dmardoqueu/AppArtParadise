import 'dart:html';

import 'package:flutter/material.dart';
import 'cart_item.dart';
import 'cadastrar_cliente.dart';
import 'cadastrar_produto.dart';
import 'cliente.dart';
import 'item_model.dart';

class ShoppingCartScreen extends StatefulWidget {
  final List<Client> clients; // Lista de clientes
  final List<Product> products; // Lista de produtos
  final Function(List<CartItem> cartItems, Client selectedClient,
      DateTime selectedDeliveryDate) onPlaceOrder;

  ShoppingCartScreen({
    required this.clients,
    required this.products,
    required this.onPlaceOrder,
  });

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List<CartItem> cartItems = [];
  Client? selectedClient;
  DateTime selectedDeliveryDate = DateTime.now();

  double calculateTotal() {
    double total = 0.0;
    for (var cartItem in cartItems) {
      total += cartItem.product.value * cartItem.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho de Compras"),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: DropdownButton<Client>(
              value: selectedClient,
              onChanged: (Client? value) {
                setState(() {
                  selectedClient = value;
                });
              },
              items:
                  widget.clients.map<DropdownMenuItem<Client>>((Client client) {
                return DropdownMenuItem<Client>(
                  value: client,
                  child: Text(client.name),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text("Data de Entrega:"),
            subtitle: Text(selectedDeliveryDate.toString()),
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: selectedDeliveryDate,
                firstDate: DateTime.now(),
                lastDate: DateTime(2101),
              ).then((value) {
                if (value != null) {
                  setState(() {
                    selectedDeliveryDate = value;
                  });
                }
              });
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              CartItem cartItem = cartItems[index];
              return ListTile(
                title: Text(cartItem.product.name),
                subtitle: Text("Quantidade: ${cartItem.quantity}"),
                trailing: Text(
                    "Subtotal: \$${(cartItem.product.value * cartItem.quantity).toStringAsFixed(2)}"),
              );
            },
          ),
          ListTile(
            title: Text("Total: \$${calculateTotal().toStringAsFixed(2)}"),
          ),
          ElevatedButton(
            onPressed: () {
              // Chame a função onPlaceOrder para realizar o pedido
              widget.onPlaceOrder(
                  cartItems, selectedClient!, selectedDeliveryDate);
            },
            child: Text("Realizar Pedido"),
          ),
        ],
      ),
    );
  }
}
