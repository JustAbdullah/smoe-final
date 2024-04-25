import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smoe_app_final/customWidgets/custom_padding.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';

import 'order_page.dart';
import 'order_page_offers.dart';

class TheOrderListUser extends StatelessWidget {
  const TheOrderListUser({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.showTheOrderList.value,
            child: Stack(children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            controller.showTheOrderList.value = false;
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColors.redColor,
                                shape: BoxShape.rectangle),
                            width: 50.w,
                            height: 20.h,
                            child: Text(
                              "X",
                              style: TextStyle(
                                  height: 1.3.h,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.whiteColor),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ),
                      PaddingCustom(
                        theTop: 10.h,
                        child: Align(
                          child: Container(
                            alignment: Alignment.center,
                            width: 200.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                color: AppColors.yellowColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "73-قائمة الطلبيات".tr,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      PaddingCustom(
                        theTop: 10.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.whatisTheOrder.value = false;
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 140.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: controller.whatisTheOrder.value
                                          ? AppColors.balckColorTypeFour
                                          : AppColors.yellowColor,
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Text(
                                    "74-طلبيات المنتجات".tr,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.whiteColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.whatisTheOrder.value = true;
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 140.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: controller.whatisTheOrder.value
                                          ? AppColors.yellowColor
                                          : AppColors.balckColorTypeFour,
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Text(
                                    "75-طلبيات العروض".tr,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.whiteColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      controller.whatisTheOrder.value
                          ? OrderListPageOffers()
                          : OrderListPage()
                    ]),
                  ),
                ),
              ),
            ])));
  }
}
