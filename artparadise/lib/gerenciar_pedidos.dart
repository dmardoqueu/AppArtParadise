import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: OrderManagementScreen(),
    ));

class Order {
  String clientName;
  String productName;
  double amount;
  DateTime date;

  Order({
    required this.clientName,
    required this.productName,
    required this.amount,
    required this.date,
  });
}

class OrderManagementScreen extends StatefulWidget {
  @override
  _OrderManagementScreenState createState() => _OrderManagementScreenState();
}

class _OrderManagementScreenState extends State<OrderManagementScreen> {
  List<Order> orders = [
    Order(
        clientName: "Cliente 1",
        productName: "Produto A",
        amount: 3,
        date: DateTime.now().subtract(Duration(days: 2))),
    Order(
        clientName: "Cliente 2",
        productName: "Produto B",
        amount: 2,
        date: DateTime.now().subtract(Duration(days: 3))),
    Order(
        clientName: "Cliente 3",
        productName: "Produto C",
        amount: 5,
        date: DateTime.now().subtract(Duration(days: 7))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerenciar Pedidos"),
        backgroundColor: Colors.black, // Define a cor da AppBar como preta
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return ListTile(
            title: Text("Cliente: ${order.clientName}"),
            subtitle: Text(
                "Produto: ${order.productName}\nQuantidade: ${order.amount.toString()}"),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Exibir um modal de confirmação antes de excluir o pedido
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Confirmação"),
                      content: Text("Deseja realmente excluir este pedido?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Fechar o modal de confirmação
                          },
                          child: Text("Cancelar"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Lógica de exclusão do pedido aqui
                            setState(() {
                              orders.removeAt(index);
                            });
                            Navigator.of(context)
                                .pop(); // Fechar o modal de confirmação
                          },
                          child: Text("Excluir"),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
