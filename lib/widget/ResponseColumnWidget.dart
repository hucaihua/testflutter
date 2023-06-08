import 'package:flutter/cupertino.dart';

class ResponseColumnWidget extends StatelessWidget{
  const ResponseColumnWidget({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
        if (constraints.maxWidth < 200) {
          return Column(mainAxisSize: MainAxisSize.min,children: children,);
        }else{
          var rowChildren = <Widget>[];
          for(int i = 0 ; i < children.length ; i += 2){
            if(i + 1 < children.length) {
              rowChildren.add(Row(children: [children[i] , children[i+1] ], mainAxisSize: MainAxisSize.min,));
            }else {
              rowChildren.add(children[i]);
            }
          }
          return Column(mainAxisSize: MainAxisSize.min,children: rowChildren,);
        }
    });
  }

}