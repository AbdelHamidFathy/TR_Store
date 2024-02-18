import 'package:get/get.dart';
import 'package:tr_store/app/apis/end_points.dart';
import 'package:tr_store/app/helper/apis_helper.dart';
import 'package:tr_store/app/models/product.dart';

class HomeApisHandler {
  APIHelper apiHelper = APIHelper();
  Future<List<Product>> getProducts() async {
    String url = EndPoints.getProducts;
    Get.log("=========== getProducts url : $url====================");
    return await apiHelper.getDataRequest(
      url: url,
      parseResponse: (response) {
        List<dynamic> productListJson = response;
        return productListJson
            .map((productJson) => Product.fromJson(productJson))
            .toList();
      },
    );
  }
}
