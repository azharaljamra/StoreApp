import 'package:app_store/core/constants/api_routes.dart';
import 'package:app_store/helpers/http_reqeust.dart';
import 'package:dio/dio.dart';
import 'package:app_store/core/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesVm extends ChangeNotifier {
  
  HttpRequest request  = HttpRequest.instance;
  List<Category> allCategories  =[];
  
  Future<void> getCategoriesFromServer() async {
    Response res  = await request.get(APIRoutes.categories);
    List<dynamic> cate= res.data;
   allCategories=
    cate.map((i)=>Category.fromJson(i) ).toList();
 notifyListeners();

    
  } 
 
  
  
}