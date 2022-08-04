// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_test__task/view/newUI/product_list_screen.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

import '../../models/newmodel/cart_model.dart';
import '../../models/newmodel/catalog_model.dart';
import '../../models/newmodel/empty_cart_provider.dart';
import '../../models/newmodel/product_group_model.dart';
import 'appbar_title_widget.dart';

class CatalogScreen extends StatefulWidget {
  final ProductGroupModel? productGroup;

  const CatalogScreen({Key? key, this.productGroup}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CatalogScreen;
    var catalog = context.read<CatalogModel>();
    void updateCatalogProductNames() {
      catalog.productNames.length;
      setState(() {});
    }

    return Scaffold(
      appBar: AppBarTitleWidget(
        title: '${args.productGroup?.title}',
        automaticallyImplyLeading: true,
      ),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: const Color(0xFF0C40A6),
        onRefresh: () async {
          await Future.delayed(
            const Duration(seconds: 1),
          );
          updateCatalogProductNames();
        },
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: catalog.productNames.length,
            itemBuilder: (context, index) {
              return ListItem(index);
            }),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final int index;
  // ignore: use_key_in_widget_constructors
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
  }) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    var isEmpty = context.read<EmptyCart>();
    var cart = context.read<CartModel>();
    var isInCart = context.select<CartModel, bool>(
      (cart) => cart.items.contains(item),
    );

    return IconButton(
      onPressed: isInCart
          ? () => cart.remove(item)
          : () {
              cart.add(item);
              isEmpty.isEmptyCart = true;
            },
      icon:
          isInCart ? Image.asset(item.iconRemove) : Image.asset(item.iconCart),
      iconSize: 40,
    );
  }
}
