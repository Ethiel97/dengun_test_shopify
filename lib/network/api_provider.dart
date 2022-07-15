import 'package:dio/dio.dart';
import 'package:shopify_dengun_test/models/product.dart';
import 'package:shopify_dengun_test/utils/constants.dart';

class ApiProvider {
  static var dio = Dio();

  Future<List<Product>> fetchProducts({Map<String, dynamic> query = const {}}) async {
    Response response = await dio.get(Constants.apiUrl);

    return List.from(response.data['products'].map((el) => Product.fromJson(el)));
  }
}
