import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../componant/secrerary_show_customer_list.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';

class SecretaryCustomerList extends StatelessWidget {
  const SecretaryCustomerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("الزبائن ",
                    style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s22),
                  ),
                  SizedBox(height: 48.h,),
                  SecreraryShowCustomerList(),
                  SizedBox(height: 48.h,),
                  SecreraryShowCustomerList(),
                  SizedBox(height: 48.h,),
                  SecreraryShowCustomerList(),
                  SizedBox(height: 48.h,),
                  SecreraryShowCustomerList(),
                  SizedBox(height: 48.h,),
                  SecreraryShowCustomerList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}