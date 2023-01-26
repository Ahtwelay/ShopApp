import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/product_item.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductGrid extends StatelessWidget {
  final bool showFav;
  ProductGrid(this.showFav);
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = showFav ? productData.favoriteItems : productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: products[i], child: ProductItem()),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
