import 'package:flutter/material.dart';
import 'cadastrar_produto.dart';

class ItemModel {
  String itemName;
  String img;
  String unit;
  double price;

  ItemModel({
    required this.itemName,
    required this.img,
    required this.unit,
    required this.price,
  });
}
