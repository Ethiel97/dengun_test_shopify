import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shopify_dengun_test/models/product.dart';
import 'package:shopify_dengun_test/repositories/product_repository.dart';
import 'package:shopify_dengun_test/screens/products_screen.dart';
import 'package:shopify_dengun_test/view_models/base_view_model.dart';

class ProductViewModel extends BaseViewModel {
  List<Product> products = [];

  List<Product> filteredProductsByTag = [];

  String selectedTag = "";

  Set<String> tags = {};

  late ProductRepository productRepository;

  @override
  FutureOr<void> init() async {
    try {
      productRepository = ProductRepository();

      products = await productRepository.getItems();

      for (var product in products) {
        tags = {...tags, ...product.tagsList};
      }
    } on Exception catch (e) {
      debugPrint("Error: $e");
      errorMessage = "An error occured";
      finishLoading();
      reloadState();
    }
  }

  void selectTag(String tag, BuildContext buildContext) {
    selectedTag = tag;
    reloadState();

    filteredProductsByTag = products
        .where((product) =>
            product.title.toLowerCase().contains(tag.toLowerCase()))
        .toList();
    reloadState();

    debugPrint("FILTERED PRODUCTS: ${filteredProductsByTag.length}");

    Navigator.of(buildContext).push(
      CupertinoPageRoute(builder: (context) => const ProductScreen()),
    );
  }

  @override
  void loadMore() {}
}
