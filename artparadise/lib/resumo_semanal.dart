import 'package:flutter/material.dart';
import 'gerenciar_pedidos.dart';

class WeeklySummaryScreen extends StatefulWidget {
  final List<Order> orders;

  WeeklySummaryScreen({required this.orders});

  @override
  _WeeklySummaryScreenState createState() => _WeeklySummaryScreenState();
}

class _WeeklySummaryScreenState extends State<WeeklySummaryScreen> {
  double calculateWeeklyTotal() {
    final DateTime now = DateTime.now();
    final DateTime oneWeekAgo = now.subtract(Duration(days: 7));

    double total = 0.0;
    for (var order in widget.orders) {
      if (order.date.isAfter(oneWeekAgo)) {
        total += order.amount;
      }
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resumo Semanal"),
        backgroundColor: Colors.black, // Define a cor da AppBar como preta
      ),
      body: Center(
        child: Text(
          "Total: R\$ ${calculateWeeklyTotal().toStringAsFixed(2)}",
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 77, 255, 83),
          ),
        ),
      ),
    );
  }
}
