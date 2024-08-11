// lib/controllers/app_controller.dart
import 'dart:developer';
import 'package:fake_store/utils/constants.dart';
import 'package:get/get.dart';
import '../data/model/product_model.dart';
import '../data/api/api_client.dart';

class AppController extends GetxController {
  final ApiClient apiClient = ApiClient();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProductData();
  }

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  List<Product> productData = <Product>[].obs;
  Future getProductData() async {
    isLoading.value = true;
    try {
      var response = await apiClient.getData(ApiConstants.users);
      // log("${response.bodyString}\n\n", name: "My data");
      productData = productFromJson(response.bodyString!);
      update();
    } catch (e) {
      log("Error : $e", name: "------------------------------- getProductData");
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  //
  // List<Product> categoriezData = [];
  // Future getCategoryData() async {
  //   String? newCategory;
  //   for (var element in productData) {
  //     String categoryName = element.category ?? "";
  //     categoriezData.add();
  //   }
  // }
}
