import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_dengun_test/views/base_view.dart';
import 'package:shopify_dengun_test/widgets/product_card.dart';

import '../view_models/product_view_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) => BaseView<ProductViewModel>(
        key: UniqueKey(),
        vmBuilder: (context) => Provider.of<ProductViewModel>(context),
        builder: buildScreen,
      );

  Widget buildScreen(
          BuildContext buildContext, ProductViewModel productViewModel) =>
      Scaffold(
        backgroundColor: const Color(0xfff5f6f7),
        appBar: AppBar(
          title: Text(
            "${productViewModel.selectedTag} Products",
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: .7,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          itemCount: productViewModel.filteredProductsByTag.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => LimitedBox(
            child: ProductCard(
              productViewModel: productViewModel,
              product: productViewModel.filteredProductsByTag[index],
            ),
          ),
        ),
      );
}
