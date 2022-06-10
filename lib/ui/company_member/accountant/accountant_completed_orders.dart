import 'package:agc_conpany/resources/color_manager.dart';
import 'package:agc_conpany/resources/font_manager.dart';
import 'package:agc_conpany/resources/styles_manager.dart';
import 'package:agc_conpany/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../componant/componant.dart';



class AccountantCompletedOrders extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [

              Expanded(
                  child: Column(
                    children: [
                      Text(
                        '  الطلبات المكتملة ',
                        style: getBoldStyle(color: ColorManager.primary),
                      ),
                      CompletedOrder(),
                    ],
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
