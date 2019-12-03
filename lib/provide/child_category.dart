import 'package:flutter/material.dart';
import '../model/category.dart';

//ChangeNotifier的混入是不用管理听众
class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = []; //商品列表
  int childIndex = 0; //子类索引值
  String categoryId = '4'; //大类ID
  String subId = ''; //小类ID
  bool isNewCategory;

  //------------------关键代码start
  int page = 1; //列表页数，当改变大类或者小类时进行改变
  String noMoreText = ''; //显示更多的标识
  //------------------关键代码end

  //点击大类时更换
  getChildCategory(List<BxMallSubDto> list, String id) {
    isNewCategory = true;
    categoryId = id;
    childIndex = 0;
    page = 1;
    subId = ''; //点击大类时，把子类ID清空
    noMoreText = '';
    BxMallSubDto all = BxMallSubDto();
    //--------修改的关键代码start
    all.mallSubId = '';
    //--------修改的关键代码end
    all.mallCategoryId = '00';
    all.mallSubName = '全部';
    all.comments = 'null';
    childCategoryList = [all];
    childCategoryList.addAll(list);
    notifyListeners();
  }

  //改变子类索引 ,
  changeChildIndex(int index, String id) {
    isNewCategory = true;
    //传递两个参数，使用新传递的参数给状态赋值
    childIndex = index;
    subId = id;
    //------------------关键代码start
    page = 1;
    noMoreText = ''; //显示更多的表示
    //------------------关键代码end
    noMoreText = '';
    notifyListeners();
  }

  //增加Page的方法f
  addPage() {
    page++;
  }

  //改变noMoreText数据
  changeNoMore(String text) {
    noMoreText = text;
    notifyListeners();
  }
}
