import 'package:flutter/material.dart';
import '../model/categoryGoodsList.dart';



class CategoryGoodsListProvide with ChangeNotifier{
  List<CategoryListData> goodsList =[];

  //点击大类时更换商品列表
  getGoodsList(List<CategoryListData> list){
    goodsList = list;
    // 在状态发生变化时（increment）通知所有用到了该model的子项更新状态。(notifyListeners)
    // 注定触发
    notifyListeners();
  }
}
