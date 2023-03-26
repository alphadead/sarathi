import 'package:sarathi/ui/auth/otp.dart';
import 'package:sarathi/ui/utils/colors.dart';
import 'package:sarathi/ui/utils/headings.dart';
import 'package:sarathi/ui/widgets/signup_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SvgPicture.asset(
              'assets/images/ellipse.svg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 240.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 37.w),
                    child: Text(
                      'OTP Verification',
                      style: heading1,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 31.w),
                    child: Text(
                      "We will send you a one-time password\nto this mobile number",
                      style: heading3,
                    ),
                  ),
                  SizedBox(
                    height: 63.h,
                  ),
                  Center(
                    child: Text(
                      "Enter Mobile Number",
                      style: heading4,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 71.w),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      textAlign: TextAlign.center,
                      style: heading2,
                      decoration: const InputDecoration(
                          // textfield decoration

                          ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        Get.to(const OtpScreen());
                      },
                      child: SignUpButton('Sign Up')),
                  const Spacer()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
