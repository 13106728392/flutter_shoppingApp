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

void main() {
  var childCategory = ChildCategory();
  var categoryGoodsListProvide= CategoryGoodsListProvide();
  var providers = Providers();
  var counter = Counter();
  var detailsInfoProvide= DetailsInfoProvide();
  

  providers
    ..provide(Provider<Counter>.value(counter))
     ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide))
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<DetailsInfoProvide>.value(detailsInfoProvide));

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
