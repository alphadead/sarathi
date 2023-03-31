import 'dart:io';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sarathi/ui/utils/colors.dart';
import 'package:sarathi/ui/utils/headings.dart';
import 'package:sarathi/ui/widgets/select_image_options.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isFormComplete = false;
  File? _image;
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  String url =
      "https://raw.githubusercontent.com/dr5hn/countries-states-cities-database/master/countries%2Bstates.json";

  var _countries = [];
  var _states = [];

  String? state;
  String? country;

  bool isCountrySelected = false;
  bool isStateSelected = false;

  Future getWorldData() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      setState(() {
        _countries = jsonResponse;
      });

      print(_countries);
    }
  }

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      setState(() {
        _image = img;
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
  void initState() {
    getWorldData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                const Color(0XFFC72FF8).withOpacity(0.70),
                const Color(0XFF52F9D1).withOpacity(0.60)
              ], begin: Alignment.topLeft, end: Alignment.bottomCenter))),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
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
                              Spacer(),
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  _showSelectPhotoOptions(context);
                                },
                                child: _image == null
                                    ? Stack(
                                        children: [
                                          Transform.rotate(
                                            angle: 30,
                                            child: Center(
                                              child: Container(
                                                width: 106,
                                                height: 106,
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0XFFB52FF8),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            36)),
                                              ),
                                            ),
                                          ),
                                          Transform.rotate(
                                            angle: -57,
                                            child: Center(
                                              child: Container(
                                                width: 104,
                                                height: 104,
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0XFF40CEF2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            36)),
                                              ),
                                            ),
                                          ),
                                          Transform.rotate(
                                            angle: 0,
                                            child: Center(
                                              child: Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    color: whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            36)),
                                                child: Center(
                                                    child: Image.asset(
                                                        'assets/icons/camera.png',
                                                        height: 27)),
                                              ),
                                            ),
                                          ),
                                        ],
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
                              ),
                              Spacer()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 29.w),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
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
                            controller: nameController,
                            decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                              ),
                              isDense: true,
                              hintText: "Your Name",
                              hintStyle: TextStyle(
                                  fontSize: heading4.fontSize,
                                  fontWeight: heading4.fontWeight,
                                  fontFamily: heading4.fontFamily,
                                  color: heading3.color),
                            ),
                          ),
                          SizedBox(height: 20.h),
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
                            controller: dobController,
                            keyboardType: TextInputType.none,
                            onTap: () async {
                              DateTime? pickDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1990),
                                  lastDate: DateTime.now());
                              if (pickDate != null) {
                                setState(() {
                                  dobController.text =
                                      DateFormat('dd-MM-yyy').format(pickDate);
                                });
                              }
                            },
                            decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                              ),
                              isDense: true,
                              hintText: "Your Birthday (dd-mm-yyyy)",
                              hintStyle: TextStyle(
                                  fontSize: heading4.fontSize,
                                  fontWeight: heading4.fontWeight,
                                  fontFamily: heading4.fontFamily,
                                  color: heading3.color),
                            ),
                          ),
                          SizedBox(height: 20.h),
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
                            controller: nameController,
                            decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                              ),
                              isDense: true,
                              hintText: "Address",
                              hintStyle: TextStyle(
                                  fontSize: heading4.fontSize,
                                  fontWeight: heading4.fontWeight,
                                  fontFamily: heading4.fontFamily,
                                  color: heading3.color),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Country',
                                    style: TextStyle(
                                        fontSize: heading4.fontSize,
                                        fontWeight: heading4.fontWeight,
                                        fontFamily: heading4.fontFamily,
                                        color: whiteColor),
                                  ),
                                  const SizedBox(height: 8),
// -------------------------Country Drop Down Menu ---------------------------------
                                  if (_countries.isEmpty)
                                    const Center(
                                        child: CircularProgressIndicator())
                                  else
                                    Container(
                                        height: 24,
                                        width: 130,
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: DropdownButton<String>(
                                          onTap: () {
                                            state = null;
                                            _states = [];
                                          },
                                          items: _countries.map((cn) {
                                            return DropdownMenuItem<String>(
                                              value: cn["name"],
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5,
                                                        vertical: 3),
                                                child: Text(
                                                  cn["name"],
                                                  style: TextStyle(
                                                      fontSize:
                                                          heading4.fontSize,
                                                      fontWeight:
                                                          heading4.fontWeight,
                                                      fontFamily:
                                                          heading4.fontFamily,
                                                      color: heading3.color),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          value: country,
                                          onChanged: (value) {
                                            setState(() {
                                              _states = [];
                                              country = value!;
                                              for (int i = 0;
                                                  i < _countries.length;
                                                  i++) {
                                                if (_countries[i]["name"] ==
                                                    value) {
                                                  _states =
                                                      _countries[i]["states"];
                                                }
                                              }
                                              isCountrySelected = true;
                                            });
                                          },
                                        ))
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'State',
                                    style: TextStyle(
                                        fontSize: heading4.fontSize,
                                        fontWeight: heading4.fontWeight,
                                        fontFamily: heading4.fontFamily,
                                        color: whiteColor),
                                  ),
                                  const SizedBox(height: 8),
                                  // -------------------------State Drop Down Menu ---------------------------------
                                  if (isCountrySelected)
                                    Container(
                                        height: 24,
                                        width: 130,
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: DropdownButton<String>(
                                          items: _states.map((st) {
                                            return DropdownMenuItem<String>(
                                              
                                              value: st["name"],
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5,
                                                        vertical: 3),
                                                child: Text(
                                                  st["name"],
                                                  style: TextStyle(
                                                      fontSize:
                                                          heading4.fontSize,
                                                      fontWeight:
                                                          heading4.fontWeight,
                                                      fontFamily:
                                                          heading4.fontFamily,
                                                      color: heading3.color),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          value: state,
                                          onChanged: (value) {
                                            setState(() {
                                              state = value!;

                                              isStateSelected = true;
                                            });
                                          },
                                        ))
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
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
                            controller: emailController,
                            decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                              ),
                              isDense: true,
                              hintText: "Your Email",
                              hintStyle: TextStyle(
                                  fontSize: heading4.fontSize,
                                  fontWeight: heading4.fontWeight,
                                  fontFamily: heading4.fontFamily,
                                  color: heading3.color),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          const SizedBox(height: 7),
                          Text(
                            'Education',
                            style: TextStyle(
                                fontSize: heading4.fontSize,
                                fontWeight: heading4.fontWeight,
                                fontFamily: heading4.fontFamily,
                                color: whiteColor),
                          ),
                          TextFormField(
                            controller: educationController,
                            decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                              ),
                              isDense: true,
                              hintText: "Your Education",
                              hintStyle: TextStyle(
                                  fontSize: heading4.fontSize,
                                  fontWeight: heading4.fontWeight,
                                  fontFamily: heading4.fontFamily,
                                  color: heading3.color),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
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
                        child: Text('Complete',
                            style: isFormComplete == true
                                ? TextStyle(
                                    fontSize: heading2.fontSize,
                                    fontFamily: heading2.fontFamily,
                                    color: const Color(0XFF2B47FC))
                                : TextStyle(
                                    fontSize: heading2.fontSize,
                                    fontFamily: heading2.fontFamily,
                                    color: const Color(0XFFC8C8C8)))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
