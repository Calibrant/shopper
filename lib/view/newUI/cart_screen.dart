// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test__task/models/newmodel/profile_model.dart';
import 'package:flutter_test__task/view/newUI/appbar_title_widget.dart';
import 'package:flutter_test__task/view/newUI/product_list_screen.dart';
import 'package:provider/src/provider.dart';

import '../../generated/l10n.dart';
import '../../models/newmodel/cart_model.dart';
import '../../models/newmodel/empty_cart_provider.dart';
import '../auth_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    return Scaffold(
      body: CartBody(cart: cart),
    );
  }
}

class CartBody extends StatelessWidget {
  const CartBody({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    var isCart = context.read<EmptyCart>();
    return Scaffold(
      appBar: AppBarTitleWidget(
        title: S.of(context).appbar_title_WS,
        automaticallyImplyLeading: false,
      ),
      body:
      isCart.isEmptyCart ?
       Column(
        children: [
          /* TotalPrice(
             total: '${cart.totalPrice(cart.items)}',
          ), */
           
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  return CustomListItem(
                    thumbnail: Image.asset(cart.items[index].thumbnail),
                    title: '${cart.items[index].name} ',
                    icon: const Icon(
                      Icons.star,
                      size: 18,
                    ),
                    rate:
                        '${double.parse(cart.items[index].rate.toStringAsFixed(1))}',
                    price: '${cart.items[index].price} ₽',
                    cart: IconButton(
                      onPressed: () => cart.remove(cart.items[index]),
                      icon: Image.asset(cart.items[index].iconRemove),
                      iconSize: 40,
                    ),
                  );
                }),
          ) 
          ,
          ConstrainedBox(
            constraints:
                const BoxConstraints.tightFor(width: 375.0, height: 56.0),
            child: ElevatedButton(
                child: Text(S.of(context).button_pay),
                onPressed: () {
                  cart.cloneItemsIds = [...cart.items.toList()];
                  isCart.isEmptyCart=false;
                  cart.removeAll();
                }),
          ),
        ],
      )
      :
      const Center(child:  Text('Корзина пуста'),),
      
    );
  }
}



//! позже удалить
class TotalPrice extends StatelessWidget {
  const TotalPrice({
    Key? key,
    required this.total,
  }) : super(key: key);
  final String total;
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              S.of(context).total_title,
              style: textStyle,
            ),
          ),
          Text(
            '$total ₽', //* ₽
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
