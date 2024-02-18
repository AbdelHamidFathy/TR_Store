import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2.h,
    );
  }
}