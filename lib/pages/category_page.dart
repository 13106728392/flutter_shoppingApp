import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../service/service_method.dart';
import 'dart:convert';
import '../model/category.dart';
import 'package:provide/provide.dart';

import '../provide/child_category.dart';

class CategoryPage extends StatefulWidget {
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)
      ..init(context); //使用ScreenUtil初始化，关键
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCategoryNav(),
            Column(
              children: <Widget>[
                RightCategoryNav(),
                CategoryGoodsList()
              ],
            )
          ],
        ),
      ),
    );
  }
}

//左侧导航菜单
class LeftCategoryNav extends StatefulWidget {
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List list = [];
  var listIndex = 0; //点击索引

  @override
  void initState() {
    _getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _leftInkWel(index);
        },
      ),
    );
  }

  //得到后台大类数据
  void _getCategory() async {
    await request('getCategory').then((val) {
      var data = json.decode(val.toString());
      CategoryModel category = CategoryModel.fromJson(data);
      setState(() {
        list = category.data;
      });
    });
  }

  Widget _leftInkWel(int index) {
    bool isClick = false;
    isClick = (index == listIndex) ? true : false;

    return InkWell(
      onTap: () {
        var childList = list[index].bxMallSubDto;

        //设置索引
        setState(() {
          listIndex = index;
        });
        // var childList = list[index].bxMallSubDto;

        Provide.value<ChildCategory>(context).getChildCategory(childList);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
            color: isClick ? Colors.black12 : Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: Text(
          list[index].mallCategoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
}

//右侧小类类别

class RightCategoryNav extends StatefulWidget {
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  List list = ['名酒', '宝丰', '北京二锅头'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<ChildCategory>(
        //加入状态管理
        builder: (context, child, childCategory) {
          return Container(
              height: ScreenUtil().setHeight(80),
              width: ScreenUtil().setWidth(570),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black12))),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: childCategory.childCategoryList.length,
                itemBuilder: (context, index) {
                  return _rightInkWell(childCategory.childCategoryList[index]);
                },
              ));
        },
      ),
    );
  }

  Widget _rightInkWell(BxMallSubDto item) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          item.mallSubName,
          style:
              TextStyle(fontSize: ScreenUtil().setSp(28), color: Colors.pink),
        ),
      ),
    );
  }
}




//商品列表
class CategoryGoodsList extends StatefulWidget {
  CategoryGoodsList({Key key}) : super(key: key);

  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
   @override
  void initState() {
    _getGoodList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('商品列表'),
    );
  }


  void _getGoodList()async{
    var data ={
      'categoryId':'4',
      'categorySubId':"",
      'page':1
    };
    await request('getMallGoods',formData:data).then((val){
      val = data = json.decode(val.toString());
      print('分类商品列表：>>>>>>>>>>>>>${data}');
    });


  }
}
