import 'package:flutter/cupertino.dart';

import '../../../core/dio.dart';

class CuisinesViewModel extends ChangeNotifier {
  List cuisines = [];

  CuisinesViewModel() {
    getProducts();
  }

  void getProducts() async {
    var response = await dio.get("/cuisines/list");
    cuisines = response.data;
    print(cuisines);
    notifyListeners();
  }
}
