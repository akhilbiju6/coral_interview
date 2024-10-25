import 'dart:convert';

import 'package:coral_interview_task/model/productlist_model/productlist_model.dart';
import 'package:coral_interview_task/view/api_url/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SplashScreenControllerBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<SplashScreenController>(() => SplashScreenController());
  }
}

class SplashScreenController extends GetxController {


   RxList<ProductListModel> productList = <ProductListModel>[].obs;
  RxBool isLoading = false.obs;

  Future<void> productListfetch() async {
    isLoading.value = true; 
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.productListUrl),
      );

      print('ProductList Raw Response  Data : ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
    print(response.body);
    productList.clear();
    for (var item in jsonData) {
      ProductListModel productModel = ProductListModel.fromJson(item);
      productList.add(productModel);
    }
    print('Product List Data Fetched: ${productList[0].id.toString()}');
       
      } else {
        print('Request failed  ${response.statusCode}');
        print('Error Response Bidy: ${response.body}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading.value = false; 
    }
  }




}

