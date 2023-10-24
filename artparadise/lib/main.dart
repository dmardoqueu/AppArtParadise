import 'package:artparadise/cadastrar_cliente.dart';
import 'package:artparadise/cadastrar_produto.dart';
import 'package:artparadise/gerenciar_pedidos.dart';
import 'package:flutter/material.dart';
import 'package:artparadise/app_data.dart' as app_data;
import 'item_tile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black, // Cor de fundo da AppBar
        scaffoldBackgroundColor: const Color.fromARGB(
            255, 109, 109, 109), // Cor de fundo do conteúdo
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ArtParadise",
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Abre o Drawer
            },
          ),
        ),
        backgroundColor: Colors.black,
      ),
      drawer: MyDrawer(), // Adicione o Drawer aqui.
      body: MyScrollableContent(),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: const Text(
              "Cadastrar produto",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => ProductRegistrationScreen()),
              );
            },
          ),
          ListTile(
            title: const Text(
              "Cadastrar cliente",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ClientRegistrationScreen(),
                ),
              ); // Fecha o Drawer
              // Adicione ação para as configurações aqui.
            },
          ),
          ListTile(
            title: const Text(
              "Gerenciar pedidos",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OrderManagementScreen(),
                ),
              ); // Fecha o Drawer
              // Adicione ação para o perfil aqui.
            },
          ),
          ListTile(
            title: const Text(
              "Resumo semanal",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context); // Fecha o Drawer
              // Adicione ação para sair aqui.
            },
          ),
        ],
      ),
    );
  }
}

class MyScrollableContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            width: size.width,
            child: Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 11.5,
                ),
                itemCount: app_data.items.length,
                itemBuilder: (_, index) {
                  return ItemTile(
                    item: app_data.items[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
