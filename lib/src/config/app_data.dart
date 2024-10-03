import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/models/user_model.dart';

ItemModel apple = ItemModel(
  description:
      "A melhor maçã da regiao e que conta com o melhor preco de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultado em uma vida saudável",
  imgUrl: "assets/fruits/apple.png",
  itemName: "Maçã",
  price: 5.5,
  unit: "kg",
);

ItemModel grape = ItemModel(
  description:
      "A melhor uva da regiao e que conta com o melhor preco de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultado em uma vida saudável",
  imgUrl: "assets/fruits/grape.png",
  itemName: "Uva",
  price: 7.5,
  unit: "kg",
);

ItemModel guava = ItemModel(
  description:
      "A melhor goiaba da regiao e que conta com o melhor preco de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultado em uma vida saudável",
  imgUrl: "assets/fruits/guava.png",
  itemName: "Goiaba",
  price: 11.5,
  unit: "kg",
);

ItemModel kiwi = ItemModel(
  description:
      "O melhor kiwi da regiao e que conta com o melhor preco de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultado em uma vida saudável",
  imgUrl: "assets/fruits/kiwi.png",
  itemName: "Kiwi",
  price: 2.5,
  unit: "un",
);

ItemModel mango = ItemModel(
  description:
      "A melhor manga da regiao e que conta com o melhor preco de qualquer mercado",
  imgUrl: "assets/fruits/mango.png",
  itemName: "Manga",
  price: 2.5,
  unit: "un",
);

ItemModel papaya = ItemModel(
  description:
      "O melhor mamão da regiao e que conta com o melhor preco de qualquer mercado",
  imgUrl: "assets/fruits/papaya.png",
  itemName: "Mamão",
  price: 8,
  unit: "kg",
);

List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categorias = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Careais',
];

List<CartItemModel> cartItems = [
  CartItemModel(
    item: apple,
    quantity: 2,
  ),
  CartItemModel(
    item: mango,
    quantity: 5,
  ),
  CartItemModel(
    item: guava,
    quantity: 2,
  ),
  CartItemModel(
    item: grape,
    quantity: 1,
  ),
];

UserModel user = UserModel(
  celular: "99 9 9999-9999",
  cpf: "999.999.999-99",
  email: "lucas@gmail.com",
  name: "Lucas Piran",
  senha: "",
);

List<OrderModel> orders = [
  OrderModel(
    copyAndPaste: 'q23faw34rsa3',
    createdDateTime: DateTime.parse("2024-09-24 09:52:10.458"),
    id: "q23faw34rsa3",
    items: [
      CartItemModel(
        item: apple,
        quantity: 2,
      ),
      CartItemModel(
        item: mango,
        quantity: 2,
      ),
    ],
    overdueDateTime: DateTime.parse("2024-12-24 12:52:10.458"),
    status: 'pending_payment',
    total: 30,
  ),
  OrderModel(
    copyAndPaste: 'j393bsdbh49',
    createdDateTime: DateTime.parse("2024-09-24 09:52:10.458"),
    id: "j393bsdbh49",
    items: [
      CartItemModel(
        item: kiwi,
        quantity: 2,
      ),
    ],
    overdueDateTime: DateTime.parse("2024-10-24 12:52:10.458"),
    status: 'delivered',
    total: 11,
  ),
  OrderModel(
    copyAndPaste: 'j393bsdbh49',
    createdDateTime: DateTime.parse("2024-09-24 09:52:10.458"),
    id: "j393bsdbh49",
    items: [
      CartItemModel(
        item: kiwi,
        quantity: 2,
      ),
    ],
    overdueDateTime: DateTime.parse("2024-10-24 12:52:10.458"),
    status: 'refunded',
    total: 22.5,
  ),
];
