import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 3.w,
    );
  }
}
