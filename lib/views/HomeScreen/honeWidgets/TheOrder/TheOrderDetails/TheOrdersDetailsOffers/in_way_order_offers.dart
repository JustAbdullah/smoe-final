import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smoe_app_final/controllers/home_controller.dart';

import '../../../../../../core/constant/app_text_styles.dart';
import '../../../../../../core/constant/appcolors.dart';
import 'order_cart_offers.dart';

class OrderPageInListOrderInWayOffers extends StatelessWidget {
  const OrderPageInListOrderInWayOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.showDetailsOrderInOrderListOffers.value,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 0.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.w),
                        child: Container(
                          alignment: Alignment.center,
                          height: 35.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: AppColors.yellowColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "204-الطلبية في الطريق".tr,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.balckColorTypeFour),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CartOrderOffers(),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "205-طلبيتك الان بالطريق سيتم إشعارك حال وصولها من أجل إستلامها"
                            .tr,
                        style: TextStyle(
                            color: const Color.fromARGB(255, 57, 57, 57),
                            fontFamily: AppTextStyles.Almarai,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
