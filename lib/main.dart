import 'package:flutter/material.dart';
import './provide/child_category.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/category_goods_list.dart';
import './provide/counter.dart';

void main() {
  var childCategory = ChildCategory();
  var categoryGoodsListProvide= CategoryGoodsListProvide();
  var providers = Providers();
  var counter = Counter();

  providers
    ..provide(Provider<Counter>.value(counter))
     ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide))
    ..provide(Provider<ChildCategory>.value(childCategory));

  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
          title: '购物App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.pink),
          home: IndexPage()),
    );
  }
}
