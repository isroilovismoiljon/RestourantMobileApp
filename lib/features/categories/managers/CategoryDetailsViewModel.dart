
import 'package:flutter/cupertino.dart';

import '../../../core/dio.dart';

class CategoryDetailsViewModel extends ChangeNotifier{
  List categoryDetailsList = [];

  CategoryDetailsViewModel(int categoryId){
    getCategoryDetails(categoryId: categoryId,);
  }

  void getCategoryDetails({required int categoryId}) async{
    var response = await dio.get("/recipes/list?Category=$categoryId");
    if (response.statusCode != 200) {
      throw Exception(response.data);
    }
    categoryDetailsList = response.data;
    notifyListeners();
  }
}