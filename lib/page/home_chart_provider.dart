import 'package:flutter/material.dart';

import '../common/P.dart';
import '../model/CarModel.dart';
import '../model/Item.dart';
import '../widget/ChangeNotifierProvider.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: HomePage
/// @Date: on 2023-06-08 21:34
class HomeChartProvider extends StatefulWidget {
  static const String sName = "HomeChartProvider";

  const HomeChartProvider({super.key});

  @override
  HomeChartProviderState createState() => HomeChartProviderState();
}

class HomeChartProviderState extends State<HomeChartProvider> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider<CarModel>(
        data: CarModel(),
        child: Builder(builder: (context) {
          return Column(
            children: <Widget>[
              Builder(builder: (context) {
                var cart = ChangeNotifierProvider.of<CarModel>(context);
                return Text("总价: ${cart?.totalPrice}");
              }),
              Builder(builder: (context) {
                P.d("ElevatedButton build"); //在后面优化部分会用到
                return ElevatedButton(
                  child: const Text("添加商品"),
                  onPressed: () {
                    //给购物车中添加商品，添加后总价会更新
                    ChangeNotifierProvider.of<CarModel>(context)
                        ?.add(Item(20.0, 1));
                  },
                );
              }),
            ],
          );
        }),
      ),
    );
  }
}
