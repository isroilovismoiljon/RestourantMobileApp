import 'package:flutter/cupertino.dart';
import '../../../core/dio.dart';

class CategoriesViewModel extends ChangeNotifier {
  List categories = [];

  CategoriesViewModel() {
    getCategories();
  }

  void getCategories() async {
    var response = await dio.get('/categories/list');
    if (response.statusCode != 200) {
      throw Exception(response.data);
    }
    categories = response.data;
    notifyListeners();
  }
}