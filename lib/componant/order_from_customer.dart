import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import '../ui/navigations_bar/accountant_nav_bar.dart';

class CustomerOrder extends StatelessWidget {
  const CustomerOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 6,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 5.h, right: 5.w),
              child: const CircleAvatar(
                radius: 38.0,
                backgroundImage: NetworkImage(
                    'https://miro.medium.com/max/1000/1*wnKTi_JRAZJ58WeWaCn7yw.jpeg'),
                backgroundColor: Colors.transparent,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('هذا النص هو مثال لنص',style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s14),),
                  SizedBox(height: 6.h,)
                  ,Row(
                    children: [
                      Text('وزن 25 كجم: '  ,style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s14.sp),),
                      Text('100'  ,style: getMediumStyle(color: ColorManager.gray,fontSize: FontSize.s14.sp),),
                      SizedBox(width: 15.w,),
                      Text('الزبون: ',style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s14.sp),),
                      Text('احمد سعيد',style: getMediumStyle(color: ColorManager.gray,fontSize: FontSize.s14.sp),),
                    ],
                  ), SizedBox(height: 4.h,),

                  Row(
                    children: [
                      Text('وزن 50 كجم: '  ,style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s14.sp),),
                      Text('50'  ,style: getMediumStyle(color: ColorManager.gray,fontSize: FontSize.s14.sp),),
                      SizedBox(width: 15.w,),
                      Text('رقم الهاتف :  ',style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s14.sp),),
                      Text('5217143',style: getMediumStyle(color: ColorManager.gray,fontSize: FontSize.s14.sp),),
                    ],
                  ),SizedBox(height: 4.h,),

                  Row(
                    children: [
                      Text('الكمية: '  ,style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s14.sp),),
                      Text('150'  ,style: getMediumStyle(color: ColorManager.gray,fontSize: FontSize.s14.sp),),
                      SizedBox(width: 15.w,),
                      Text(': تاريخ الطلب: ',style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s14.sp),),
                      Text('12/12/2021',style: getMediumStyle(color: ColorManager.gray,fontSize: FontSize.s14.sp),),
                    ],
                  ),SizedBox(height: 4.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 69.w,
                        height: 20.h,
                        child: ElevatedButton(onPressed: () => Get.to(()=>NavScreen()),
                          child: Text('قبول',style: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s10.sp),)
                          ,style: ElevatedButton.styleFrom(
                              primary: ColorManager.primary,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(AppSize.s5))
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w,),
                      SizedBox(
                        width: 69.w,
                        height: 20.h,
                        child: ElevatedButton(onPressed: () => Get.to(()=>NavScreen()),
                          child:Text('رفض',style: getRegularStyle(color: ColorManager.reject,fontSize: FontSize.s14.sp),)
                          ,style: ElevatedButton.styleFrom(
                              primary: ColorManager.white,
                              side: BorderSide(width: 1.0, color: ColorManager.reject,),elevation: 1, shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSize.s5))
                          ),),
                      ),
                     SizedBox(width: 15.w,),
                      SvgPicture.asset(
                        IconAssets.time,width: 13.w,height: 13.h,
                      ),
                      SizedBox(width: 6.w,),
                      Text('منذ 3 ساعات ', style: getRegularStyle(color: ColorManager.grayTime,fontSize: FontSize.s13)),

                    ],
                  ),



                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}
