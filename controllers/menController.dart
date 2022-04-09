import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter_hope/constants/firebase.dart';
import 'package:flutter_hope/models/product.dart';

class MenController extends GetxController {
  static MenController instance = Get.find();
  RxList<ProductModel> products = RxList<ProductModel>([]);
  String collection = "men";

  @override
  onReady() {
    super.onReady();
    products.bindStream(getAllProducts());
    print(firebaseFirestore.collection(collection).snapshots().toList());
  }

  Stream<List<ProductModel>> getAllProducts() =>
      firebaseFirestore.collection(collection).snapshots().map((query) =>
          query.docs.map((item) => ProductModel.fromMap(item.data())).toList());
}
