import 'dart:math' as math;
import 'package:agc_conpany/componant/accountant_add_category.dart';
import 'package:agc_conpany/componant/accountant_notification.dart';
import 'package:agc_conpany/resources/color_manager.dart';
import 'package:agc_conpany/resources/font_manager.dart';
import 'package:agc_conpany/resources/styles_manager.dart';
import 'package:agc_conpany/ui/registration/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../componant/accountant_completed_order.dart';

class HomeAccountant extends StatelessWidget {
  List<String> MONTHS = [
    "يناير",
    "فبراير",
    "مارس",
    "أبريل",
    "مايو",
    "يونيو",
    "يوليو",
    "أغسطس",
    "سبتمبر",
    "أكتوبر",
    "نوفمبر",
    "ديسمبر"
  ];
  List<String> day = [
    'الأثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
    'السبت',
    'الأحد',
  ];
  ScrollController rrectController = ScrollController();
  DateTime now = new DateTime.now();
  String formattedDateTime() {
    return now.day.toString() + " " + MONTHS[now.month - 1];
  }

  String formattedDay() {
    return day[now.weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 133.h,
              decoration: const BoxDecoration(
                  color: Color(0xFF182B4C),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              child: Stack(
                children: [
                  Positioned(
                      top: 30,
                      right: 16,
                      left: 0,
                      child: Row(
                        children: [
                          Text(
                            'أهلاً بك أحمد',
                            style: getBoldStyle(color: ColorManager.white,fontSize: FontSize.s30),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.notifications,
                                size: 30,
                                color: Colors.white,
                              ))
                        ],
                      )),
                  Positioned(
                      top: 75,
                      right: 16,
                      left: 0,
                      child: Text(
                        formattedDateTime(),
                        style: getMediumStyle(color: ColorManager.textOrange,fontSize: FontSize.s20),
                      )),
                  Positioned(
                      top: 92,
                      right: 16,
                      left: 0,
                      child: Row(
                        children: [
                          Text(
                            formattedDay(),
                            style:getMediumStyle(color: ColorManager.white,fontSize: FontSize.s15)
                          ),
                          const Spacer(),
                          InkWell(
                              onTap: () => Get.to(()=>Login()),
                              child: Container(
                                child: Row(
                                  children: [
                                      Text(
                                      'تسجيل الخروج',
                                      style: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s13)),

                                    Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.rotationY(math.pi),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.logout,
                                            size: 27,
                                            color: Colors.white,
                                          )),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.h, right: 16.w),
              child: Text(
                'اخر الاشعارات',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),
            // Container(
            //   height: 320,
            //   child: Column(
            //     children: [
            //       Expanded(
            //         child: Scrollbar(
            //           isAlwaysShown: true,
            //           showTrackOnHover: true,
            //           hoverThickness: 15.0,
            //           child: ListView.builder(
            //             physics: const BouncingScrollPhysics(),
            //             padding: const EdgeInsets.only(bottom: 60),
            //             controller: rrectController,
            //             itemCount: 15,
            //             itemBuilder: (context, index) {
            //               return AccountantNotification();
            //             },
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SingleChildScrollView(
            //   child: Expanded(
            //     child: ListView.builder(
            //         itemCount: 5,
            //         itemBuilder: (context, ind) {
            //           return AccountantNotification();
            //         }),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  AccountantNotification(),
                  AccountantAddCategory(label: "دقيق حيفا", onTap: (){}),
                  SizedBox(height: 30.h,),CompletedOrder()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
