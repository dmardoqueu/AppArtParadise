import 'package:flutter/material.dart';
import 'package:artparadise/item_model.dart';
import 'package:artparadise/utils_services.dart';
import 'carrinho.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;
  final Function(ItemModel, int)
      addToCart; // Mantenha a definição para aceitar um ItemModel

  ItemTile({Key? key, required this.item, required this.addToCart})
      : super(key: key);

  final UtilsServices utilServices = UtilsServices();

  void _showQuantityDialog(BuildContext context) {
    int quantity = 1;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text("Selecione a Quantidade"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              actions: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.red.shade900,
                    ),
                  ),
                  onPressed: () {
                    // Adicione o item ao carrinho com a quantidade selecionada
                    addToCart(item, quantity);
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(
                      color: Color.fromRGBO(
                        183,
                        28,
                        28,
                        1,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 3,
          shadowColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // IMAGEM
                Expanded(
                  child: Hero(
                    tag: item.img,
                    child: Image.asset(item.img),
                  ),
                ),

                // NOME
                Text(
                  item.itemName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // PREÇO E UNIDADE
                Row(
                  children: [
                    Text(
                      utilServices.priceToCurrency(item.price),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '/${item.unit}',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),

        // ADICIONAR AO CARRINHO
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {
              _showQuantityDialog(context); // Chame a função do modal aqui
            },
            child: Container(
              height: 40,
              width: 35,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
