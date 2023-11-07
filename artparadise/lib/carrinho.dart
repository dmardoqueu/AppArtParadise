import 'package:flutter/material.dart';
import 'cart_item.dart';
import 'cliente.dart';
import 'item_model.dart';
import 'cadastrar_produto.dart';
import 'app_data.dart' as app_data;

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
  ShoppingCartScreenState createState() => ShoppingCartScreenState();
}

class ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List<CartItem> cartItems = [];
  Client? selectedClient;
  DateTime selectedDeliveryDate = DateTime.now();

  // Utilize um Map para rastrear a quantidade de cada produto
  Map<String, int> productQuantities = {};

  double calculateTotal(List<ItemModel> products) {
    double total = 0.0;
    for (var product in products) {
      total += product.price;
    }
    return total;
  }

  void addItemToCart(ItemModel item) {
    final itemName = item.itemName;

    if (productQuantities.containsKey(itemName)) {
      // Se o item já existe no mapa, atualize a quantidade
      productQuantities[itemName] = (productQuantities[itemName] ?? 0) + 1;
    } else {
      // Se o item não existe no mapa, adicione-o com quantidade 1
      productQuantities[itemName] = 1;
    }

    if (productQuantities[itemName]! > 0) {
      for (var cartItem in cartItems) {
        if (cartItem.product.name == itemName) {
          // Atualize a quantidade do item existente
          cartItem.quantity = (productQuantities[itemName] ?? 0);
          setState(() {
            productQuantities[itemName] =
                0; // Zere a quantidade após adicionar ao carrinho
          });
          return;
        }
      }

      // Se o item não estiver no carrinho, adicione-o
    }
  }

  List<ItemModel> fictitiousProducts = [
    ItemModel(
      itemName: "Caneca Tradicional",
      img: "assets/produto1.png",
      unit: "un",
      price: 25.0,
    ),
    ItemModel(
      itemName: "Camisa Personalizada",
      img: "assets/produto2.png",
      unit: "un",
      price: 25.0,
    ),
    ItemModel(
      itemName: "Balde de gelo",
      img: "assets/produto3.png",
      unit: "un",
      price: 38.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho de Compras"),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Selecionar Cliente",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ),
              DropdownButton<Client>(
                value: selectedClient,
                onChanged: (Client? value) {
                  setState(() {
                    selectedClient = value;
                  });
                },
                items: widget.clients
                    .map<DropdownMenuItem<Client>>((Client client) {
                  return DropdownMenuItem<Client>(
                    value: client,
                    child: Text(client.name),
                  );
                }).toList(),
              ),
            ],
          ),
          // Exibição da lista fictícia de produtos
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Produtos selecionados',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: fictitiousProducts.length,
                itemBuilder: (context, index) {
                  ItemModel product = fictitiousProducts[index];

                  return ListTile(
                    title: Text(product.itemName),
                    subtitle: Text(
                      "Preço: R\$${product.price.toStringAsFixed(2)}",
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (productQuantities
                                  .containsKey(product.itemName)) {
                                productQuantities[product.itemName] =
                                    (productQuantities[product.itemName] ?? 0) -
                                        1;
                              }
                            });
                          },
                        ),
                        Text(
                          (productQuantities[product.itemName] ?? 0).toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              if (productQuantities
                                  .containsKey(product.itemName)) {
                                productQuantities[product.itemName] =
                                    (productQuantities[product.itemName] ?? 0) +
                                        1;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      addItemToCart(
                          product); // Adicione o produto ao carrinho com a quantidade selecionada
                    },
                  );
                },
              ),
              ListTile(
                title: Text(
                  "Total: R\$${calculateTotal(fictitiousProducts).toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          // Lista de produtos selecionados no carrinho
          ListView.builder(
            shrinkWrap: true,
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              CartItem cartItem = cartItems[index];
              return ListTile(
                title: Text(cartItem.product.name),
                subtitle: Text("Quantidade: ${cartItem.quantity}"),
                trailing: Text(
                  "Subtotal: \$${(cartItem.product.value * cartItem.quantity).toStringAsFixed(2)}",
                ),
              );
            },
          ),
          ListTile(
            title: const Text(
              "Data de Entrega:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.red.shade900,
                  ),
                ),
                onPressed: () {
                  // Chame a função onplaceorder para realizar o pedido
                  widget.onPlaceOrder(
                      cartItems, selectedClient!, selectedDeliveryDate);
                },
                child: const Text(
                  "Realizar Pedido",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
