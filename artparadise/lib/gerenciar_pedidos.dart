import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: OrderManagementScreen(),
    ));

class Order {
  String clientName;
  String productName;
  double amount;
  bool isEdited;

  Order({
    required this.clientName,
    required this.productName,
    required this.amount,
    this.isEdited = false,
  });
}

class OrderManagementScreen extends StatefulWidget {
  @override
  _OrderManagementScreenState createState() => _OrderManagementScreenState();
}

class _OrderManagementScreenState extends State<OrderManagementScreen> {
  List<Order> orders = []; // Lista de pedidos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerenciar Pedidos"),
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
              icon: Icon(order.isEdited ? Icons.check : Icons.edit),
              onPressed: () {
                // Lógica de edição do pedido aqui
                if (!order.isEdited) {
                  // Se não estiver em modo de edição, você pode implementar a edição do pedido.
                  // Por exemplo, abrir uma tela de edição.
                } else {
                  // Se já estiver em modo de edição, você pode salvar as alterações.
                  // Por exemplo, atualizar os dados do pedido na lista de pedidos.
                  // Aqui, simplesmente vou alternar o estado de "isEdited".
                  setState(() {
                    order.isEdited = false;
                  });
                }
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Adicionar um novo pedido
          showDialog(
            context: context,
            builder: (context) {
              final TextEditingController clientNameController =
                  TextEditingController();
              final TextEditingController productNameController =
                  TextEditingController();
              final TextEditingController amountController =
                  TextEditingController();

              return AlertDialog(
                title: Text("Novo Pedido"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: clientNameController,
                      decoration: InputDecoration(labelText: "Nome do Cliente"),
                    ),
                    TextField(
                      controller: productNameController,
                      decoration: InputDecoration(labelText: "Nome do Produto"),
                    ),
                    TextField(
                      controller: amountController,
                      decoration: InputDecoration(labelText: "Quantidade"),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancelar"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final clientName = clientNameController.text;
                      final productName = productNameController.text;
                      final amount =
                          double.tryParse(amountController.text) ?? 0.0;

                      if (clientName.isNotEmpty &&
                          productName.isNotEmpty &&
                          amount > 0) {
                        // Adicionar o novo pedido à lista de pedidos
                        setState(() {
                          orders.add(Order(
                              clientName: clientName,
                              productName: productName,
                              amount: amount));
                        });
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text("Adicionar"),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
