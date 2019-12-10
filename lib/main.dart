import 'package:flutter/material.dart';
import './provide/child_category.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/category_goods_list.dart';
import './provide/counter.dart';
import 'package:fluro/fluro.dart';
import './routers/routes.dart';
import './routers/application.dart';
import './provide/details_info.dart';
import './provide/cart.dart';
import './provide/currentIndex.dart';

void main() {
  var childCategory= ChildCategory();
  var categoryGoodsListProvide= CategoryGoodsListProvide();
  var detailsInfoProvide= DetailsInfoProvide();
  var cartProvide  =CartProvide();
  var currentIndexProvide  =CurrentIndexProvide();
  var counter =Counter();
  var providers  =Providers();
  

  providers
     ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide))
    ..provide(Provider<DetailsInfoProvide>.value(detailsInfoProvide))
    ..provide(Provider<CartProvide>.value(cartProvide))
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide))
    ..provide(Provider<Counter>.value(counter));

    runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //配置路由
    final router = Router();
    Routes.configureRoutes(router);
    //全局使用
    Application.router=router;


    return Container(
      child: MaterialApp(
          title: '购物App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.pink),
          home: IndexPage()),
    );
  }
}
