import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sarathi/ui/utils/colors.dart';
import 'package:sarathi/ui/utils/headings.dart';

class CareerCounsellingPage extends StatefulWidget {
  const CareerCounsellingPage({super.key});

  @override
  State<CareerCounsellingPage> createState() => _CareerCounsellingPageState();
}

class _CareerCounsellingPageState extends State<CareerCounsellingPage> {
  //
  @override
  void initState() {
    super.initState();
    checkResult();
  }

  checkResult() {
    //TODO
    // isResultReady = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: SizedBox(
        height: 80.h,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/home.png'),
                  size: 25,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/bell.png'),
                  size: 25,
                ),
                label: 'Notification'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/person.png'),
                  size: 22,
                ),
                label: 'Person'),
          ],
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              height: 350.h,
              child: SvgPicture.asset(
                'assets/images/careerastrology.svg',
                fit: BoxFit.cover,
              )),
          Column(
            children: [
              SizedBox(
                height: 320.h,
              ),
              SizedBox(
                  height: 340,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/tree.png',
                    fit: BoxFit.contain,
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                SizedBox(
                  height: 340.h,
                ),
                Stack(
                  children: [
                    Container(
                      height: 188.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: greyColor.withOpacity(0.50),
                          borderRadius: BorderRadius.circular(20.r)),
                    ),
                    Center(
                        child: Padding(
                      padding: EdgeInsets.fromLTRB(12.w, 24.h, 12.w, 12.h),
                      child: Container(
                          height: 170.h,
                          child: SvgPicture.asset(
                            "assets/images/reminder.svg",
                            fit: BoxFit.contain,
                          )),
                    ))
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(colors: [
                        greenColor.withOpacity(0.52),
                        yellowColor.withOpacity(0.74)
                      ])),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 18.w),
                          child: Text(
                            "Astrology Data",
                            style: TextStyle(fontSize: heading5.fontSize, fontFamily: heading5.fontFamily, fontWeight: heading3.fontWeight, color: blackColor),
                          ),
                        ),
                        Switch(
                          // This bool value toggles the switch.
                          value: true,
                          activeColor: Colors.white,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {});
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
