import 'package:shopify_dengun_test/models/product.dart';
import 'package:shopify_dengun_test/network/api_provider.dart';
import 'package:shopify_dengun_test/repositories/i_repository.dart';

class ProductRepository implements IRepository<Product> {
  @override
  Future<List<Product>> getItems(
      {Map<String, dynamic> query = const {}}) async {
    List<Product> products = await ApiProvider().fetchProducts(query: query);

    return products;
  }
}
