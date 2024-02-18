import 'package:tr_store/app/apis/home/home_api_handler.dart';
import 'package:tr_store/app/models/product.dart';

class HomeRepo {
  final HomeApisHandler homeApiProvider = HomeApisHandler();
  Future<List<Product>> getProducts() {
    return homeApiProvider.getProducts();
  }
}
