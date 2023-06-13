import 'package:flutter/material.dart';
import 'package:testflutter/generated/assets.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: TestAnimationHero
/// @Date: on 2023-06-13 11:22
class TestAnimationHero extends StatelessWidget {
  static const String sName = "TestAnimationHero";

  const TestAnimationHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.only(top: 50),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            InkWell(
              child: Hero(
                tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
                child: ClipOval(
                  child: Image.asset(
                    Assets.imagesLogo,
                    width: 50.0,
                  ),
                ),
              ),
              onTap: () {
                Future.delayed(Duration(milliseconds: 200), (){
                  //打开B路由
                  Navigator.push(context, PageRouteBuilder(
                    pageBuilder: (
                        BuildContext context,
                        animation,
                        secondaryAnimation,
                        ) {
                      return FadeTransition(
                        opacity: animation,
                        child: Scaffold(
                          appBar: AppBar(
                            title: const Text("原图"),
                          ),
                          body: HeroAnimationRouteB(),
                        ),
                      );

                      // return Scaffold(
                      //   appBar: AppBar(
                      //     title: const Text("原图"),
                      //   ),
                      //   body: HeroAnimationRouteB(),
                      // );
                    },
                  ));
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("点击头像"),
            )
          ],
        ),
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset(Assets.imagesLogo),
      ),
    );
  }
}