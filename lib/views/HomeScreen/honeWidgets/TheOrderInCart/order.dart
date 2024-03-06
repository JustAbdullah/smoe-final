import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smoe_app_final/customWidgets/custom_padding.dart';
import 'package:smoe_app_final/views/HomeScreen/honeWidgets/TheOrderInCart/PartOfCart/cart.dart';
import 'package:smoe_app_final/views/HomeScreen/honeWidgets/ProductrsDetails/extras.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';
import '../../../../customWidgets/custom_cachednetworkimage.dart';
import '../../../../customWidgets/custom_text.dart';
import 'PartOfCart/cart_page.dart';
import 'PartOfOrder/the_part_order.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.showCart.value,
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
              Align(
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
                                controller.showCart.value = false;
                                controller.countTheOrderStep.value = 1;
                                controller.totalPrice.value = 0;
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
                                    theText: "التفاصيل",
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
                                          "السلة".tr,
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
                                            child: controller.countTheOrderStep
                                                        .value >=
                                                    2
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
                                          "الطلبية".tr,
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
                                            child: controller.countTheOrderStep
                                                        .value >=
                                                    3
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
                                          "في الطريق".tr,
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
                                            child: controller.countTheOrderStep
                                                        .value >=
                                                    4
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
                                          "التسليم".tr,
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
                            child: Expanded(
                                child: controller.countTheOrderStep.value == 1
                                    ? CartPage()
                                    : OrderPage()),
                          ),
                        ]),
                      ),
                      Visibility(
                          visible: controller.countTheOrderStep.value <= 1,
                          child: Positioned(
                              bottom: 30.h,
                              left: 10.w,
                              right: 10.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                        alignment: Alignment.center,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                            color: AppColors.redColor,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          child: Text(
                                            "حذف السلة".tr,
                                            style: TextStyle(
                                                height: 1.3.h,
                                                fontSize: 17,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                color: AppColors.whiteColor),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.addIntoOrder(
                                          controller.randomNumber.toString(),
                                          controller.totalPrice.value
                                              .toString());
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                            color: AppColors.yellowColor,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          child: Text(
                                            "إنشاء الطلبية".tr,
                                            style: TextStyle(
                                                height: 1.3.h,
                                                fontSize: 17,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                color: AppColors
                                                    .balckColorTypeFour),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                  ),
                                ],
                              ))),
                      Visibility(
                          visible: controller.addOrder.value,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            color: Colors.black38,
                          )),
                      Visibility(
                          visible: controller.addOrder.value,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            color: Colors.black38,
                          )),
                      Visibility(
                          visible: controller.addOrder.value,
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Lottie.asset(ImagesPath.loadingAnimation,
                                    height: 200.h,
                                    width: 300.w,
                                    fit: BoxFit.cover),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  "الرجاء الإنتظار يتم إضافة الطلبية الان".tr,
                                  style: TextStyle(
                                      height: 1.3.h,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.whiteColor),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ])));
  }
}
