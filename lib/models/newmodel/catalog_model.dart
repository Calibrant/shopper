// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter_test__task/models/product_model.dart';

class CatalogModel {
  List productNames = [
    'Товар 1',
    'Товар 2',
    'Товар 3',
    'Товар 4',
    'Товар 5',
    'Товар 6',
    'Товар 7',
    'Товар 8',
    'Товар 9',
    'Товар 10',
  ];

  static List productThumbnail = [
    'assets/images/unsplash_JjvLtQcegb0.png',
    'assets/images/unsplash_Fbft0pYhbp4.png',
    'assets/images/unsplash_XOhI_kW_TaM.png',
    'assets/images/unsplash_Fbft0pYhbp4.png',
    'assets/images/unsplash_JjvLtQcegb0.png',
    'assets/images/unsplash_Fbft0pYhbp4.png',
    'assets/images/unsplash_XOhI_kW_TaM.png',
    'assets/images/unsplash_Fbft0pYhbp4.png',
    'assets/images/unsplash_Fbft0pYhbp4.png',
    'assets/images/unsplash_Fbft0pYhbp4.png',
  ];
  static List productPrice = [
    100,
    150,
    240,
    90,
    310,
    190,
    220,
    75,
    75,
    75,
  ];

  var random = Random();

  double doubleInRange(random, num start, num end) =>
      random.nextDouble() * (end - start) + start;

  static const iconCart = 'assets/images/Frame 21.png';
  static const iconRemove = 'assets/images/delete_item.png';

  Item getById(int id) => Item(
        id: id,
        name: productNames[id % productNames.length],
        rate: doubleInRange(random, 0, 5),
        price: productPrice[id % productPrice.length],
        thumbnail: productThumbnail[id % productThumbnail.length],
        iconCart: iconCart,
        iconRemove: iconRemove,
        orderNumber: ProductModel().random.nextInt(20000) + 10000,
      );

  Item getByPosition(int position) {
    return getById(position);
  }
}

class Item {
  final int id;
  final String name;
  final double rate;
  final int price;
  final String thumbnail;
  final String iconCart;
  final String iconRemove;
  final int orderNumber;

  Item({
    required this.id,
    required this.name,
    required this.rate,
    required this.price,
    required this.thumbnail,
    required this.iconCart,
    required this.iconRemove,
    required this.orderNumber,
  });

  Item copyWith({
    int? id,
    String? name,
    double? rate,
    int? price,
    String? thumbnail,
    String? iconCart,
    String? iconRemove,
    int? orderNumber,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      rate: rate ?? this.rate,
      price: price ?? this.price,
      thumbnail: thumbnail ?? this.thumbnail,
      iconCart: iconCart ?? this.iconCart,
      iconRemove: iconRemove ?? this.iconRemove,
      orderNumber: orderNumber ?? this.orderNumber,
    );
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
