import 'package:flutter/material.dart';

import '../models/newmodel/product_group_model.dart';

class ProductGroupWidget extends StatelessWidget {
  const ProductGroupWidget({Key? key, this.productGroup, this.press}) : super(key: key);
  final ProductGroupModel? productGroup;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Image.asset(
                    '${productGroup!.image}',
                  ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${productGroup!.title}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff212121),
                        ),
                      ),
                      Text('${productGroup!.sum} шт.'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
