import 'dart:ffi';

import 'package:app_store/core/constants/api_routes.dart';
import 'package:app_store/core/models/product.dart';
import 'package:app_store/helpers/http_reqeust.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ProductVm extends ChangeNotifier {

int total =0;
List<Product> allProducts= [];

HttpRequest request = HttpRequest.instance;

void getProductsFromServer()async {
  Response res = await request.get(APIRoutes.products);

  List<dynamic>allProducts = res.data["products"];
 this.allProducts= allProducts.map((i)=>Product.fromJson(i)).toList();

 notifyListeners();




}

addOne(){
  total++;
  notifyListeners();
}
}