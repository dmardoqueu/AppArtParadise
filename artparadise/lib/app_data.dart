import 'package:artparadise/item_model.dart';
import 'cliente.dart';

ItemModel caneca = ItemModel(
  itemName: 'Caneca Tradicional',
  img: 'assets/products/caneca.jpeg',
  unit: 'un',
  price: 25.0,
);

ItemModel longDrink = ItemModel(
  itemName: 'Copo Long Drink',
  img: 'assets/products/long_drink.jpeg',
  unit: 'un',
  price: 3.80,
);

ItemModel camisa = ItemModel(
  itemName: 'Camisa Personali...',
  img: 'assets/products/camisa.jpeg',
  unit: 'un',
  price: 25.0,
);

ItemModel quadro_14x21 = ItemModel(
  itemName: 'Quadro 14x21cm',
  img: 'assets/products/quadro_14x21.jpeg',
  unit: 'un',
  price: 10.0,
);

ItemModel quadro_17x24 = ItemModel(
  itemName: 'Quadro 17x24cm',
  img: 'assets/products/quadro_17x24.jpeg',
  unit: 'un',
  price: 14.0,
);

ItemModel quadro_19x28 = ItemModel(
  itemName: 'Quadro 19x28cm',
  img: 'assets/products/quadro_19x28.jpeg',
  unit: 'un',
  price: 17.0,
);

ItemModel quadro_30x40 = ItemModel(
  itemName: 'Quadro 30x40cm',
  img: 'assets/products/quadro_30x40.jpeg',
  unit: 'un',
  price: 35.0,
);

ItemModel quadro_35x50 = ItemModel(
  itemName: 'Quadro 35x50cm',
  img: 'assets/products/quadro_35x50.jpeg',
  unit: 'un',
  price: 50.0,
);

ItemModel quadro_40x60 = ItemModel(
  itemName: 'Quadro 40x60cm',
  img: 'assets/products/quadro_40x60.jpeg',
  unit: 'un',
  price: 65.0,
);

ItemModel quadro_50x75 = ItemModel(
  itemName: 'Quadro 50x75cm',
  img: 'assets/products/quadro_50x75.jpeg',
  unit: 'un',
  price: 85.0,
);

ItemModel azulejo_15x15 = ItemModel(
  itemName: 'Azulejo 15x15cm',
  img: 'assets/products/azulejo_15x15.png',
  unit: 'un',
  price: 25.0,
);

ItemModel baldeGelo = ItemModel(
  itemName: 'Balde de Gelo',
  img: 'assets/products/balde.jpg',
  unit: 'un',
  price: 38.0,
);

ItemModel chinelo = ItemModel(
  itemName: 'Chinelo Persona...',
  img: 'assets/products/chinelo.jpg',
  unit: 'un',
  price: 25.0,
);

ItemModel chaveiroAcrilico = ItemModel(
  itemName: 'Chaveiro Acrílico',
  img: 'assets/products/chaveiro_acrilico.jpg',
  unit: 'un',
  price: 25.0,
);

ItemModel tacaGinDegrade = ItemModel(
  itemName: 'Taça Gin Degradê',
  img: 'assets/products/taca_gin_degrade.jpeg',
  unit: 'un',
  price: 25.0,
);

ItemModel squeeze_aluminio = ItemModel(
  itemName: 'Squeeze de alumínio',
  img: 'assets/products/squeeze_aluminio.jpg',
  unit: 'un',
  price: 35.0,
);

Client diogo = Client(
    name: "Diôgo",
    city: "Guarabira",
    neighborhood: "Rua honorato araújo filho",
    address: "nordeste 2",
    phone: "83999713261");

Client david = Client(
    name: "David Bezerra",
    city: "Guarabira",
    neighborhood: "Rua honorato araújo filho",
    address: "nordeste 2",
    phone: "8399982455");

Client marinez = Client(
    name: "Marinez Bezerra",
    city: "Guarabira",
    neighborhood: "Rua Amália coelho",
    address: "centro",
    phone: "83988537759");

Client adriano = Client(
    name: "Adriano",
    city: "Guarabira",
    neighborhood: "Avenida Dom Pedro II",
    address: "centro",
    phone: "83988325468");

List<ItemModel> items = [
  caneca,
  longDrink,
  camisa,
  quadro_19x28,
  quadro_14x21,
  quadro_17x24,
  quadro_30x40,
  quadro_35x50,
  quadro_40x60,
  quadro_50x75,
  azulejo_15x15,
  baldeGelo,
  chaveiroAcrilico,
  chinelo,
  tacaGinDegrade,
  squeeze_aluminio
];

List<Client> clients = [
  adriano,
  david,
  diogo,
  marinez,
];



// List<CartItemModel> cartItems = [
//   CartItemModel(
//     item: apple,
//     quantity: 2,
//   ),
//   CartItemModel(
//     item: guava,
//     quantity: 1,
//   ),
//   CartItemModel(
//     item: grape,
//     quantity: 3,
//   ),
// ];
