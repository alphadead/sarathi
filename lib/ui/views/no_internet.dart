import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sarathi/ui/utils/colors.dart';
import 'package:sarathi/ui/utils/headings.dart';

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      children: [
        Spacer(),
        Image.asset('assets/images/connection.png'),
        SizedBox(height: 20.h,),
        Center(child: Text('No Internet', style: TextStyle(fontFamily: heading2.fontFamily, color: blackColor, fontSize: heading2.fontSize, fontWeight: heading1.fontWeight),)),
        SizedBox(height: 20.h,),
        Center(child: Text('Please check your internet connection', style: heading3,)),
        Spacer(),
      ],
    )
    );
  }
}
