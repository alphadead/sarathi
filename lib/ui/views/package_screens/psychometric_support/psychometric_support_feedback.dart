import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sarathi/ui/utils/colors.dart';

class PsychometricSupportFeedback extends StatefulWidget {
  const PsychometricSupportFeedback({super.key});

  @override
  State<PsychometricSupportFeedback> createState() =>
      _PsychometricSupportFeedbackState();
}

class _PsychometricSupportFeedbackState
    extends State<PsychometricSupportFeedback> {
  bool isResultReady = true;
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 320.h,
                    ),
                    SizedBox(
                        height: 360,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/astrologywheel.png',
                          fit: BoxFit.cover,
                        )),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 340.h,
                    ),
                    Column(
                      children: [
                        SizedBox(
                            height: 232.h,
                            width: MediaQuery.of(context).size.width,
                            child: isResultReady == false
                                ? Stack(
                                    children: [
                                      Center(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            SizedBox(
                                                height: 64.h,
                                                width: 84.w,
                                                child: Image.asset(
                                                  'assets/icons/greencheck.png',
                                                  fit: BoxFit.contain,
                                                )),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              'Thanks for registering!',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: blackColor),
                                            ),
                                            Text(
                                              'We will get back to you soon.',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: blackColor),
                                            ),
                                            const Spacer()
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 232.h,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.black.withAlpha(90),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                    ],
                                  )
                                : Stack(
                                    children: [
                                      Container(
                                        height: 232.h,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.black.withAlpha(90),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 232.h,
                                                child: Column(
                                                  children: [
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12.0),
                                                      child: SizedBox(
                                                          height: 36.h,
                                                          width: 34.w,
                                                          child: Image.asset(
                                                            'assets/icons/moon.png',
                                                            fit: BoxFit.fill,
                                                          )),
                                                    ),
                                                    const Spacer()
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 232.h,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.70,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    Text(
                                                      'Hey Adarsh, hope you are doing fine.',
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 22,
                                                          color: blackColor),
                                                    ),
                                                    SizedBox(
                                                      height: 12.h,
                                                    ),
                                                    Text(
                                                      'Yor are more inclined towards ABC.\nDownload PDF for more details.',
                                                      maxLines: 4,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 22,
                                                          color: blackColor),
                                                    ),
                                                    const Spacer()
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                      ],
                    ),
                    const Spacer(),
                    isResultReady == true
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Download ',
                                  style: TextStyle(
                                      fontSize: 15, color: blackColor),
                                ),
                                const Text(
                                  'PDF',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.red),
                                )
                              ],
                            ),
                          )
                        : const SizedBox()
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
