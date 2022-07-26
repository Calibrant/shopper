import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../models/product_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var item = context.read<ProductModel>();

    return Center(
      child: Container(
        width: 200,height: 200,
        child: Text('${item.name}'),
      ),
    );
  }
}
