import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:sarathi/ui/auth/email_verify.dart';
import 'package:sarathi/ui/auth/login.dart';
import 'package:sarathi/ui/utils/colors.dart';
import 'package:sarathi/ui/utils/headings.dart';

import '../../controllers/auth_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthController _authController = Get.find<AuthController>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SvgPicture.asset(
              'assets/images/ellipselogin.svg',
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 223.h,
                        ),
                        Text(
                          'Sign Up',
                          style: heading1,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Text(
                          'Email Address',
                          style: heading4,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextField(
                          controller: emailController,
                          style: TextStyle(
                              fontFamily: heading4.fontFamily,
                              color: heading1.color,
                              fontSize: heading4.fontSize,
                              fontWeight: heading2.fontWeight),
                          decoration: InputDecoration(
                            isDense: true,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: blueColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 33.h,
                        ),
                        Text(
                          'Password',
                          style: heading4,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextField(
                          controller: passwordController,
                          style: TextStyle(
                              fontFamily: heading4.fontFamily,
                              color: heading1.color,
                              fontSize: heading4.fontSize,
                              fontWeight: heading2.fontWeight),
                          decoration: InputDecoration(
                            isDense: true,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: blueColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 53.h,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Text(
                              'Forget Password?',
                              style: TextStyle(
                                  fontFamily: heading3.fontFamily,
                                  color: blueColor,
                                  fontSize: heading3.fontSize,
                                  fontWeight: heading3.fontWeight),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 63.h,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: GestureDetector(
                          onTap: () async{
                            await _authController.register(
                            emailController.text, passwordController.text);
                          },
                          child: Image.asset(
                            'assets/images/signupbutton.png',
                            fit: BoxFit.fill,
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(const LoginPage());
                        },
                        child: Text(
                          'Already have an account?\nClick to login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: heading3.fontFamily,
                              color: blueColor,
                              fontSize: heading3.fontSize,
                              fontWeight: heading3.fontWeight),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
