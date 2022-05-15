import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import '../../../componant/componant.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';

class SalespersonCustomerOrder extends StatelessWidget {
  const SalespersonCustomerOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(

                children: [
                  Text('طلبات الزبائن',
                    style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s22),
                  ),

                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder:(context, index) {

                      return CustomerOrder();
                    } ,itemCount: 10,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}