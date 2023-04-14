import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sarathi/ui/auth/user_info.dart';
import 'package:sarathi/ui/utils/colors.dart';
import 'package:sarathi/ui/utils/headings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sarathi/ui/views/home.dart';

import '../../controllers/auth_controller.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({super.key});

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  OtpFieldController otpController = OtpFieldController();
  final AuthController _authController = Get.find<AuthController>();
  String otpvalue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 44, left: 165),
            child: SizedBox(
              // width: MediaQuery.of(context).size.width,
              height: 155.h,
              width: 160.w,
              child: Image.asset(
                'assets/images/biometric.png',
                fit: BoxFit.contain,
              ),
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
                    child: Column(
                      children: [
                        Text(
                          "Enter the OTP sent to ",
                          style: heading3,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.60,
                          child: Text(
                            _authController.emailAuth.value,
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: heading3.fontSize,
                                color: heading3.color,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 63.h,
                  ),
                  Center(
                    child: Text(
                      "Enter OTP",
                      style: heading4,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.w),
                    child: OTPTextField(
                      controller: otpController,
                      length: 4,
                      width: MediaQuery.of(context).size.width,
                      // fieldWidth: 80,
                      style: TextStyle(fontSize: 17),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.underline,
                      onCompleted: (pin) {
                        setState(() {
                          otpvalue = pin;
                        });
                        print("Completed: " + pin);
                      },
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     _otpFieldBox(true, false),
                    //     _otpFieldBox(false, false),
                    //     _otpFieldBox(false, false),
                    //     _otpFieldBox(false, true)
                    //   ],
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 26, left: 31),
                    child: GestureDetector(
                        onTap: () {},
                        child: Text('Resend OTP',
                            style: TextStyle(
                                fontSize: heading4.fontSize,
                                color: blue2Color,
                                fontWeight: heading4.fontWeight))),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: GestureDetector(
                        onTap: () {
                          print(_authController.emailAuth.value);
                          print(otpvalue);
                          _authController.verifyOTP(
                              _authController.emailAuth.value, otpvalue);
                          // Get.to(HomePage());
                        },
                        child: Image.asset('assets/images/verify.png')),
                  ),
                  const Spacer()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // _otpFieldBox(bool first, last) {
  //   return SizedBox(
  //     width: 50,
  //     child: TextFormField(
  //       controller: otpController,
  //       onChanged: (value) {
  //         if (value.length == 1 && last == false) {
  //           FocusScope.of(context).nextFocus();
  //         }
  //         if (value.isEmpty && first == false) {
  //           FocusScope.of(context).previousFocus();
  //         }
  //       },
  //       decoration: InputDecoration(
  //         focusedBorder: UnderlineInputBorder(
  //           borderSide: BorderSide(color: blueColor),
  //         ),
  //       ),
  //       style: heading2,
  //       textAlign: TextAlign.center,
  //       keyboardType: TextInputType.number,
  //       inputFormatters: [
  //         LengthLimitingTextInputFormatter(1),
  //         FilteringTextInputFormatter.digitsOnly
  //       ],
  //     ),
  //   );
  // }
}
