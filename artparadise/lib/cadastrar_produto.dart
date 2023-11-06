import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:artparadise/app_data.dart' as app_data;

class Product {
  String name;
  XFile? image; // Alteração: XFile para armazenar a imagem.
  double value;
  String unit;

  Product({
    required this.name,
    required this.image,
    required this.value,
    required this.unit,
  });
}

class ProductRegistrationScreen extends StatefulWidget {
  @override
  _ProductRegistrationScreenState createState() =>
      _ProductRegistrationScreenState();
}

class _ProductRegistrationScreenState extends State<ProductRegistrationScreen> {
  final TextEditingController nameController = TextEditingController();
  XFile? image; // Alteração: Armazene a imagem como XFile.
  final TextEditingController valueController = TextEditingController();
  final TextEditingController unitController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = XFile(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 109, 109),
        title: const Text(
          "Cadastro de Produto",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 180,
                height: 180,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  onPressed: _pickImage,
                  child: const Icon(
                    Icons.image_search_rounded,
                    size: 50,
                    color: Colors.black,
                  ),
                ),
              ),
              if (image != null)
                Image.file(
                  File(image!.path),
                ),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: "Nome do Produto",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: valueController,
                    decoration: const InputDecoration(
                      labelText: "Valor",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: unitController,
                    decoration: const InputDecoration(
                      labelText: "Unidade",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.red.shade900),
                ),
                onPressed: () {
                  final String name = nameController.text;
                  final double value =
                      double.tryParse(valueController.text) ?? 0.0;
                  final String unit = unitController.text;

                  // Crie uma instância de produto com os valores inseridos
                  Product product = Product(
                    name: name,
                    image: image,
                    value: value,
                    unit: unit,
                  );

                  // Você pode fazer algo com o objeto 'product' aqui, como salvar em um banco de dados.

                  // Limpe os campos após o cadastro
                  nameController.clear();
                  image = null;
                  valueController.clear();
                  unitController.clear();

                  // Exiba uma mensagem de sucesso, por exemplo.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Produto cadastrado com sucesso!"),
                      duration: Duration(seconds: 5),
                    ),
                  );
                },
                child: const Text("Cadastrar Produto"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
