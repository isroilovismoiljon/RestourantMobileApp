import 'package:flutter/cupertino.dart';

import '../../../core/dio.dart';

class ProductRecipesViewModel extends ChangeNotifier{
  Map productRecipes = {};

  ProductRecipesViewModel(int recipeId){
    getRecipesByProductId(recipeId: recipeId);
  }

  void getRecipesByProductId({required int recipeId}) async {
    var response = await dio.get(
      "/recipes/detail/$recipeId",
    );
    if (response.statusCode != 200) {
      throw Exception(response.data);
    }
    productRecipes = response.data;
    notifyListeners();
  }
}
