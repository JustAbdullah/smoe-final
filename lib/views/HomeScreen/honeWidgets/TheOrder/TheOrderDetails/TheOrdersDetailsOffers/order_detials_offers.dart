import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smoe_app_final/customWidgets/custom_padding.dart';
import 'package:smoe_app_final/views/HomeScreen/home_screen.dart';

import '../../../../../../controllers/home_controller.dart';
import '../../../../../../core/constant/app_text_styles.dart';
import '../../../../../../core/constant/appcolors.dart';
import '../../../../../../core/constant/images_path.dart';
import '../../../../../../customWidgets/custom_text.dart';
import 'in_way_order_offers.dart';
import 'the_part_order_offers.dart';

class OrderDetialsOnListOrderOffers extends StatelessWidget {
  const OrderDetialsOnListOrderOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Scaffold(
                body: SafeArea(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                controller.showDetailsOrderInOrderListOffers
                                    .value = false;

                                Get.to(HomeScreen());
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
                              theTop: 20.h,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: TextCustom(
                                    theText: "208-التفاصيل".tr,
                                    fontSizeWidth: 20,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.balckColorTypeFour),
                              )),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 80.h,
                              decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ]),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 30.w),
                                  child: Row(children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 40.w,
                                          height: 35.h,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle),
                                          child: Center(
                                            child: Lottie.asset(
                                                ImagesPath.success,
                                                repeat: false),
                                          ),
                                        ),
                                        Text(
                                          "209-السلة".tr,
                                          style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.theAppColorYellow,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 11.h),
                                      child: Container(
                                        width: 45.w,
                                        height: 1.h,
                                        color: AppColors.balckColorTypeFour,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 40.w,
                                          height: 35.h,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle),
                                          child: Center(
                                            child: controller
                                                            .dataListOffers[
                                                                controller
                                                                    .indexTheOrder
                                                                    .value]
                                                            .order_status ==
                                                        "2" ||
                                                    controller
                                                            .dataListOffers[
                                                                controller
                                                                    .indexTheOrder
                                                                    .value]
                                                            .order_status ==
                                                        "3" ||
                                                    controller
                                                            .dataListOffers[
                                                                controller
                                                                    .indexTheOrder
                                                                    .value]
                                                            .order_status ==
                                                        "4"
                                                ? Lottie.asset(
                                                    ImagesPath.success,
                                                    repeat: false)
                                                : Text(
                                                    "2",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai,
                                                        color: AppColors
                                                            .balckColorTypeFour,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.center,
                                                  ),
                                          ),
                                        ),
                                        Text(
                                          "210-الطلبية".tr,
                                          style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.theAppColorYellow,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 11.h),
                                      child: Container(
                                        width: 45.w,
                                        height: 1.h,
                                        color: AppColors.balckColorTypeFour,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 40.w,
                                          height: 35.h,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle),
                                          child: Center(
                                            child: controller
                                                        .dataListOffers[
                                                            controller
                                                                .indexTheOrder
                                                                .value]
                                                        .order_status ==
                                                    "3"
                                                ? Lottie.asset(
                                                    ImagesPath.success,
                                                    repeat: false)
                                                : Text(
                                                    "3",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai,
                                                        color: AppColors
                                                            .balckColorTypeFour,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.center,
                                                  ),
                                          ),
                                        ),
                                        Text(
                                          "211-في الطريق".tr,
                                          style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.theAppColorYellow,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 11.h),
                                      child: Container(
                                        width: 45.w,
                                        height: 1.h,
                                        color: AppColors.balckColorTypeFour,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 40.w,
                                          height: 35.h,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle),
                                          child: Center(
                                            child: controller
                                                        .dataListOffers[
                                                            controller
                                                                .indexTheOrder
                                                                .value]
                                                        .order_status ==
                                                    "4"
                                                ? Lottie.asset(
                                                    ImagesPath.success,
                                                    repeat: false)
                                                : Text(
                                                    "4",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai,
                                                        color: AppColors
                                                            .balckColorTypeFour,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.center,
                                                  ),
                                          ),
                                        ),
                                        Text(
                                          "212-التسليم".tr,
                                          style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.theAppColorYellow,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 600.h,
                              child: controller
                                              .dataListOffers[controller
                                                  .indexTheOrder.value]
                                              .order_status ==
                                          "3" ||
                                      controller
                                              .dataListOffers[controller
                                                  .indexTheOrder.value]
                                              .order_status ==
                                          "4"
                                  ? OrderPageInListOrderInWayOffers()
                                  : OrderPageInListOrderOffers()),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
