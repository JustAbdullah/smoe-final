import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smoe_app_final/core/constant/images_path.dart';

import '../controllers/home_controller.dart';
import '../core/constant/app_text_styles.dart';
import '../core/constant/appcolors.dart';
import '../customWidgets/custom_text.dart';

class WaitAddOrders extends StatelessWidget {
  const WaitAddOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => Visibility(
          visible: controller.waitAddOrder.value,
          child: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black38,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black38,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black38,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      ImagesPath.loadingAnimation,
                      width: 200.w,
                    ),
                    TextCustom(
                        theText: "279-يتم إنشاء الطلبية".tr,
                        fontSizeWidth: 17.sp,
                        fontFamily: AppTextStyles.Almarai,
                        fontWeight: FontWeight.bold,
                        fontColor: AppColors.whiteColor),
                  ]),
            )
          ])),
    );
  }
}
