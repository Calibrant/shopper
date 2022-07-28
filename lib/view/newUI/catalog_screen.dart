// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_test__task/view/newUI/product_list_screen.dart';
import 'package:provider/src/provider.dart';

import '../../models/newmodel/cart_model.dart';
import '../../models/newmodel/catalog_model.dart';
import '../../models/newmodel/product_group_model.dart';
import 'appbar_title_widget.dart';

class CatalogScreen extends StatelessWidget {
  final ProductGroupModel? productGroup;

  const CatalogScreen({Key? key, this.productGroup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CatalogScreen;
    var catalog = context.read<CatalogModel>();
    return Scaffold(
      appBar: AppBarTitleWidget(
        title: '${args.productGroup?.title}',
        automaticallyImplyLeading: true,
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: catalog.productNames.length,
          itemBuilder: (context, index) {
            return ListItem(index);
          }),
    );
  }
}

class ListItem extends StatelessWidget {
  final int index;
  const ListItem(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    var item = context.select<CatalogModel, Item>(
      (catalog) => catalog.getByPosition(index),
    );
    return CustomListItem(
      thumbnail: Image.asset(item.thumbnail),
      title: '${item.name} ',
      icon: const Icon(
        Icons.star,
        size: 18,
        color: Color(0xFFECB800),
      ),
      rate: '${double.parse(item.rate.toStringAsFixed(1))}',
      price: '${item.price} ₽',
      cart: AddButton(item: item),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    required this.item,
  });
  final Item item;
  @override
  Widget build(BuildContext context) {
    var cart = context.read<CartModel>();
    var isInCart = context.select<CartModel, bool>(
      (cart) => cart.items.contains(item),
    );

    return IconButton(
      onPressed: isInCart
          ? () => cart.remove(item)
          : () {
              cart.add(item);
             
            },
      icon:
          isInCart ? Image.asset(item.iconRemove) : Image.asset(item.iconCart),
      iconSize: 40,
    );
  }
}
