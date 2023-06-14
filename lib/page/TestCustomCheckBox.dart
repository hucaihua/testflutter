import 'package:flutter/cupertino.dart';

import '../widget/CustomCheckbox.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Comment: TestCustomCheckBox
/// @Date: on 2023-06-05 10:53
class CustomCheckboxTest extends StatefulWidget {
  const CustomCheckboxTest({Key? key}) : super(key: key);

  @override
  State<CustomCheckboxTest> createState() => _CustomCheckboxTestState();
}

class _CustomCheckboxTestState extends State<CustomCheckboxTest> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: 16,
              height: 16,
              child: CustomCheckbox(
                strokeWidth: 1,
                radius: 1,
                value: _checked,
                onChanged: _onChange,
              ),
            ),
          ),
          SizedBox(
            width: 30,
            height: 30,
            child: CustomCheckbox(
              strokeWidth: 3,
              radius: 3,
              value: _checked,
              onChanged: _onChange,
            ),
          ),
        ],
      ),
    );
  }

  void _onChange(value) {
    setState(() => _checked = value);
  }
}