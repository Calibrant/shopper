import 'dart:math';

import 'newmodel/product_group_model.dart';

class ProductModel {
  final int? id;
  final ProductGroupModel? productGroupId;
  final String? name, thumbnail, cart;
  final double? rate;
  final int? price;

  ProductModel({
    this.id,
    this.productGroupId,
    this.name,
    this.thumbnail,
    this.rate,
    this.price,
    this.cart,
  });

  var random = Random();

  double doubleInRange(random, num start, num end) =>
      random.nextDouble() * (end - start) + start;
}

final rate = ProductModel().doubleInRange(ProductModel().random, 0, 5);
const imageCart = 'assets/images/Frame 21.png';

List product = <ProductModel>[
  ProductModel(
    id: 1,
    productGroupId: ProductGroupModel(id: 1),
    thumbnail: 'assets/images/unsplash_JjvLtQcegb0.png',
    name: 'Товар 1',
    rate: rate,
    price: 100,
    cart: imageCart,
  ),
  ProductModel(
    id: 2,
    productGroupId: ProductGroupModel(id: 2),
    thumbnail: 'assets/images/unsplash_Fbft0pYhbp4.png',
    name: 'Товар 2',
    rate: rate,
    price: 250,
    cart: imageCart,
  ),
  ProductModel(
    id: 3,
    productGroupId: ProductGroupModel(id: 3),
    thumbnail: 'assets/images/unsplash_XOhI_kW_TaM.png',
    name: 'Товар 3',
    rate: rate,
    price: 90,
    cart: imageCart,
  ),
  ProductModel(
    id: 4,
    productGroupId: ProductGroupModel(id: 4),
    thumbnail: 'assets/images/unsplash_Fbft0pYhbp4.png',
    name: 'Товар 4',
    rate: rate,
    price: 310,
    cart: imageCart,
  ),
  ProductModel(
    id: 5,
    productGroupId: ProductGroupModel(id: 5),
    thumbnail: 'assets/images/unsplash_JjvLtQcegb0.png',
    name: 'Товар 5',
    rate: rate,
    price: 100,
    cart: imageCart,
  ),
  ProductModel(
    id: 6,
    productGroupId: ProductGroupModel(id: 6),
    thumbnail: 'assets/images/unsplash_Fbft0pYhbp4.png',
    name: 'Товар 6',
    rate: rate,
    price: 250,
    cart: imageCart,
  ),
  ProductModel(
    id: 7,
    productGroupId: ProductGroupModel(id: 7),
    thumbnail: 'assets/images/unsplash_XOhI_kW_TaM.png',
    name: 'Товар 7',
    rate: rate,
    price: 90,
    cart: imageCart,
  ),
  ProductModel(
    id: 8,
    productGroupId: ProductGroupModel(id: 8),
    thumbnail: 'assets/images/unsplash_Fbft0pYhbp4.png',
    name: 'Товар 8',
    rate: rate,
    price: 310,
    cart: imageCart,
  ),
];
