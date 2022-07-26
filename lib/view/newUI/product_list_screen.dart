// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../models/newmodel/product_group_model.dart';
import '../../models/product_model.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({
    Key? key,
    this.productGroup,
  }) : super(key: key);

  final ProductGroupModel? productGroup;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  /* Future refresh() async {
    setState(() {
      product;
    });
  } */

  @override
  Widget build(BuildContext context) {
    // product.sort((p1, p2) => p1.price!.compareTo(p2.price!.toInt()));
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('${widget.productGroup!.title}'),
          backgroundColor: const Color(0xFF0C40A6),
        ),
        body: ListView.builder(
            itemCount: product.length,
            itemBuilder: (context, index) {
              return CustomListItem(
                thumbnail: Image.asset('${product[index].thumbnail}'),
                title: '${product.elementAt(index).name} ',
                icon: const Icon(
                  Icons.star,
                  size: 18,
                  color: Color(0xFFECB800),
                ),
                rate:
                    '${double.parse(product[index].rate!.toStringAsFixed(1))}',
                price: '${product[index].price} ₽',
                cart: Image.asset('${product[index].cart}'),
              );
            }));
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.icon,
    required this.rate,
    required this.price,
    required this.cart,
    this.button,
  }) : super(key: key);
  final Widget thumbnail;
  final String title;
  final Icon icon;
  final String rate;
  final String price;
  final Widget cart;
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(
        const Size(double.infinity, 70),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            //  ),
            Expanded(
              child: TitleIconRateAndPriceGroupWidget(
                title: title,
                icon: icon,
                rate: rate,
                price: price,
              ),
            ),
            Align(alignment: Alignment.center, child: cart),
          ],
        ),
      ),
    );
  }
}

class TitleIconRateAndPriceGroupWidget extends StatelessWidget {
  const TitleIconRateAndPriceGroupWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.rate,
    required this.price,
  }) : super(key: key);
  final String title;
  final Icon icon;
  final String rate;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            // flex: 3,
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w400),
                ),
                icon,
                Text(
                  rate,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(
            // flex: 2,
            child: Text(
              price,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
