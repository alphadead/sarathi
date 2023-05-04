import 'dart:convert';
import 'dart:io';
import 'dart:convert' as convert;
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:sarathi/controllers/user_controller.dart';
import 'package:sarathi/models/user.dart';
import 'package:sarathi/ui/utils/colors.dart';
import 'package:sarathi/ui/utils/headings.dart';
import 'package:sarathi/ui/utils/routes.dart';
import 'package:sarathi/ui/views/edit_user_profile.dart';
import 'package:sarathi/ui/views/home.dart';
import 'package:sarathi/ui/widgets/select_image_options.dart';

import '../../controllers/auth_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.user});
  final User user;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthController _authController = Get.find<AuthController>();
  final UserController _userController = Get.find<UserController>();
  File? _image;
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  bool isImageUpdated = false;
  bool isEmailUpdated = false;
  bool isAddressCorrect = false;
  bool isEducationCorrect = false;
  String imgUrl =
      'https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg';


  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      setState(() {
        _image = img;
        // isImageSelected = true;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Stack(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              const Color(0XFF3BC04B).withOpacity(0.71),
              const Color(0XFFCA8A48).withOpacity(1.0)
            ], begin: Alignment.topLeft, end: Alignment.bottomCenter))),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Stack(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Align(
                            alignment: const Alignment(-0.9, -0.8),
                            child: Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: whiteColor,
                            ))),
                    SizedBox(
                      height: 120.h,
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Spacer(),
                          _image == null
                              ? Center(
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 10,
                                              spreadRadius: 5)
                                        ],
                                        image: DecorationImage(
                                            image: NetworkImage(imgUrl),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(36)),
                                  ),
                                )
                              : Center(
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 10,
                                              spreadRadius: 5)
                                        ],
                                        image: DecorationImage(
                                            image: FileImage(_image!),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(36)),
                                  ),
                                ),
                          const Spacer()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 29.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    // -------------- Name TextField ----------------
                    Text(
                      'Name',
                      style: TextStyle(
                          fontSize: heading4.fontSize,
                          fontWeight: heading4.fontWeight,
                          fontFamily: heading4.fontFamily,
                          color: whiteColor),
                    ),
                    const SizedBox(height: 7),
                    TextFormField(
                      readOnly: true,
                      controller: nameController,
                      keyboardType: TextInputType.none,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45),
                        ),
                        isDense: true,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    // -------------- DOB TextField ----------------
                    Text(
                      'Date of Birth',
                      style: TextStyle(
                          fontSize: heading4.fontSize,
                          fontWeight: heading4.fontWeight,
                          fontFamily: heading4.fontFamily,
                          color: whiteColor),
                    ),
                    const SizedBox(height: 7),
                    TextFormField(
                      readOnly: true,
                      controller: dobController,
                      keyboardType: TextInputType.none,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45),
                        ),
                        isDense: true,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    // -------------- Address TextField ----------------
                    Text(
                      'Address Line 1',
                      style: TextStyle(
                          fontSize: heading4.fontSize,
                          fontWeight: heading4.fontWeight,
                          fontFamily: heading4.fontFamily,
                          color: whiteColor),
                    ),
                    const SizedBox(height: 7),
                    TextFormField(
                      readOnly: true,
                      controller: addressController,
                      keyboardType: TextInputType.none,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45),
                        ),
                        isDense: true,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    // -------------- Country TextField --------------
                     Text(
                      'Country',
                      style: TextStyle(
                          fontSize: heading4.fontSize,
                          fontWeight: heading4.fontWeight,
                          fontFamily: heading4.fontFamily,
                          color: whiteColor),
                    ),
                    const SizedBox(height: 7),
                    TextFormField(
                      readOnly: true,
                      controller: countryController,
                      keyboardType: TextInputType.none,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45),
                        ),
                        isDense: true,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    // -------------- State TextField --------------
                     Text(
                      'State',
                      style: TextStyle(
                          fontSize: heading4.fontSize,
                          fontWeight: heading4.fontWeight,
                          fontFamily: heading4.fontFamily,
                          color: whiteColor),
                    ),
                    const SizedBox(height: 7),
                    TextFormField(
                      readOnly: true,
                      controller: stateController,
                      keyboardType: TextInputType.none,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45),
                        ),
                        isDense: true,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    // -------------- Email TextField ----------------
                    Text(
                      'Email ID',
                      style: TextStyle(
                          fontSize: heading4.fontSize,
                          fontWeight: heading4.fontWeight,
                          fontFamily: heading4.fontFamily,
                          color: whiteColor),
                    ),
                    const SizedBox(height: 7),
                    TextFormField(
                      readOnly: true,
                      controller: emailController,
                      keyboardType: TextInputType.none,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45),
                        ),
                        isDense: true,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    // -------------- Education TextField ----------------
                    Text(
                      'Education',
                      style: TextStyle(
                          fontSize: heading4.fontSize,
                          fontWeight: heading4.fontWeight,
                          fontFamily: heading4.fontFamily,
                          color: whiteColor),
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: educationController,
                      keyboardType: TextInputType.none,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45),
                        ),
                        isDense: true,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(EditProfilePage(user: _userController.user.value));
                },
                child: Container(
                  height: 72.h,
                  width: 315.w,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 5),
                            blurRadius: 6,
                            spreadRadius: 3)
                      ],
                      borderRadius: BorderRadius.circular(28),
                      color: whiteColor),
                  child: Center(
                      child: Text('Edit Profile',
                          style: TextStyle(
                              fontSize: heading2.fontSize,
                              fontFamily: heading2.fontFamily,
                              color: const Color(0XFF2B47FC)))),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ],
    ));
  }

  _fetchUserData() async {
    nameController.text = widget.user.name.toString();
    dobController.text = widget.user.dob.toString();
    addressController.text = widget.user.address!.line1.toString();
    emailController.text = widget.user.email.toString();
    educationController.text = widget.user.education.toString();
    countryController.text = widget.user.address!.country.toString();
    stateController.text = widget.user.address!.state.toString();
    setState(() {
      imgUrl = widget.user.image.toString();
    });
  }
}
