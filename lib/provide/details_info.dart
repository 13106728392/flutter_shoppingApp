import 'package:flutter/material.dart';
import '../model/details.dart';
import '../service/service_method.dart';
import 'dart:convert'; //用来使用josn.decode

class DetailsInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo = null;

  //获取后台数据
  getGoodsInfo(String id) async{   //异步处理
    var formData = {'goodId': id};
    await request('getGoodDetailById', formData: formData).then((val) {
      var responseData = json.decode(val.toString());
      print(responseData);
      goodsInfo = DetailsModel.fromJson(responseData);
      //通知操作
      notifyListeners();
    });
  }

  bool isLeft = true;
  bool isRight = false;

//改变tabbar的状态
  changeLeftAndRight(String changeState) {
    if (changeState == 'left') {
      isLeft = true;
      isRight = false;
    } else {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }
}
