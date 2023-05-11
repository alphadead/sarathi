import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
  final formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.find<AuthController>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SvgPicture.asset(
              'assets/images/ellipselogin.svg',
              fit: BoxFit.fill,
            ),
          ),
          Form(
            key: formKey,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
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
                          TextFormField(
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
                              keyboardType: TextInputType.emailAddress,
                              autofillHints: const [AutofillHints.email],
                              validator: (email) => email != null &&
                                      !EmailValidator.validate(email)
                                  ? 'The email address is incomplete'
                                  : null),
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
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Password';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 33.h,
                          ),
                          Text(
                            'Confirm Password',
                            style: heading4,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextFormField(
                            controller: confirmPasswordController,
                            obscureText: true,
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Confirm Password';
                              } else if (value != passwordController.text) {
                                return 'Passwords are not same';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 33.h)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.w),
                      child: Container(
                        height: 72.h,
                        width: 315.w,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                                spreadRadius: 2,
                                offset: Offset(0, 3))
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(28.r)),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0XFF01AE4F).withOpacity(0.52),
                              const Color(0XFFF0D700).withOpacity(0.74)
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(28.r)),
                          child: RawMaterialButton(
                            onPressed: () async {
                              final form = formKey.currentState!;
                              if (form.validate()) {
                                // if (passwordController.text == confirmPasswordController.text) {
                                await _authController.register(
                                    emailController.text,
                                    passwordController.text);
                                // }
                              }
                            },
                            splashColor: Colors.green,
                            child: Stack(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 28.w),
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                                Positioned(
                                  right: -15.w,
                                  top: -110.h,
                                  height: 144.h,
                                  width: 134.w,
                                  child: Container(
                                    decoration: ShapeDecoration(
                                      color: const Color(0XFF3BC04B)
                                          .withOpacity(0.73),
                                      shape: const CircleBorder(),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: -70.w,
                                  top: -100.h,
                                  height: 144.h,
                                  width: 144.w,
                                  child: Container(
                                    decoration: ShapeDecoration(
                                      color: const Color(0XFFCA8A48)
                                          .withOpacity(.72),
                                      shape: const CircleBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
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
            ),
          )
        ],
      ),
    );
  }
}
