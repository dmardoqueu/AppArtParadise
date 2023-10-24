import 'package:flutter/material.dart';

class ClientRegistrationScreen extends StatefulWidget {
  const ClientRegistrationScreen({super.key});
  @override
  _ClientRegistrationScreenState createState() =>
      _ClientRegistrationScreenState();
}

class _ClientRegistrationScreenState extends State<ClientRegistrationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController neighborhoodController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Cadastro de Cliente"),
        backgroundColor: const Color.fromARGB(255, 109, 109, 109),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Nome",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: cityController,
              decoration: const InputDecoration(
                labelText: "Cidade",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: neighborhoodController,
              decoration: const InputDecoration(
                labelText: "Bairro",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: "Logradouro",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: "Telefone",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.red.shade900,
                  ),
                ),
                onPressed: () {
                  // Lógica de cadastro de cliente aqui
                  final String name = nameController.text;
                  final String city = cityController.text;
                  final String neighborhood = neighborhoodController.text;
                  final String address = addressController.text;
                  final String phone = phoneController.text;

                  // Você pode salvar os dados do cliente ou realizar outra ação necessária aqui.

                  // Limpe os campos após o cadastro
                  nameController.clear();
                  cityController.clear();
                  neighborhoodController.clear();
                  addressController.clear();
                  phoneController.clear();

                  // Exiba uma mensagem de sucesso, por exemplo.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Cliente cadastrado com sucesso!"),
                    ),
                  );
                },
                child: const Text(
                  "Cadastrar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(
      const MaterialApp(
        home: ClientRegistrationScreen(),
      ),
    );