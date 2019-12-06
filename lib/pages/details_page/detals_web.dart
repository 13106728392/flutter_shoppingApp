
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/details_info.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DetailsWeb  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     ScreenUtil.instance = ScreenUtil(width: 750, height: 1334);
    var goodsDetail = Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodInfo.goodsDetail;
    print(goodsDetail);
    return Provide<DetailsInfoProvide>(
      builder: (context,child,val){
        var isLeft = Provide.value<DetailsInfoProvide>(context).isLeft;
        if(isLeft){  //是详情页的就返回详情
          return Container(
            
             child: Html(
                data: goodsDetail,
                padding: EdgeInsets.only(bottom: 60),
              ),
          );
        }else{
          return Container(
              width: ScreenUtil().setWidth(750),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child:Text('暂时没有数据')
            );
        }
      },
    );
  }
}
