import 'package:flutter/material.dart';
import './router_handler.dart';
import 'package:fluro/fluro.dart';

//我们还需要对路由有一个总体的配置，比如跟目录，出现不存在的路径如何显示，工作中我们经常把这个文件单独写一个文件

class Routes {
  static String root = '/';
  static String detailsPage = '/detail';
  static void configureRoutes(Router router) {
    //沒有就new一个
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ERROR====>ROUTE WAS NOT FONUND!!!');
    });

    router.define(detailsPage,handler:detailsHanderl);
  }
}
