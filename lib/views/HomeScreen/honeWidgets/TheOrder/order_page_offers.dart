import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smoe_app_final/views/HomeScreen/honeWidgets/TheOrder/TheOrderDetails/TheOrdersDetailsOffers/order_detials_offers.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../customWidgets/custom_text.dart';

class OrderListPageOffers extends StatelessWidget {
  const OrderListPageOffers({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Obx(() {
      return Container(
          width: MediaQuery.sizeOf(context).width,
          child: homeController.isNotEmptyOffersOrders.value
              ? Container(
                  alignment: Alignment.topCenter,
                  height: 500.h,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.whiteColor,
                  child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      reverse: true,
                      itemCount: homeController.dataListOffers.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.whiteColorTypeOne,
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "76-رقم الطلبية:".tr,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColors.balckColorTypeThree,
                                              fontFamily: AppTextStyles.Almarai,
                                              fontSize: 14.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                          Text(
                                            homeController
                                                .dataListOffers[index].order_id
                                                .toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColors.balckColorTypeThree,
                                              fontFamily: AppTextStyles.Almarai,
                                              fontSize: 14.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "77-إجمالي الطلبية:".tr,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColors.balckColorTypeThree,
                                              fontFamily: AppTextStyles.Almarai,
                                              fontSize: 14.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                          Row(
                                            children: [
                                              TextCustom(
                                                theText: homeController
                                                    .dataListOffers[index].total
                                                    .toString(),
                                                fontColor: const Color.fromARGB(
                                                    255, 30, 105, 34),
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                fontSizeWidth: 14,
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              TextCustom(
                                                theText: "78-ريال".tr,
                                                fontColor: AppColors
                                                    .balckColorTypeThree,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                fontSizeWidth: 12,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "79-حالة الطلبية:".tr,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors
                                                      .balckColorTypeThree,
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  fontSize: 14.sp,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Column(children: [
                                                TextCustom(
                                                  theText: homeController
                                                              .dataListOffers[
                                                                  index]
                                                              .order_status ==
                                                          3
                                                      ? "80-تم التسليم".tr
                                                      : "81-مراجعة".tr,
                                                  fontColor: AppColors
                                                      .balckColorTypeThree,
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  fontSizeWidth: 12,
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    homeController
                                                        .goToDetailsOrderOffers(
                                                            index);
                                                    Get.to(
                                                        OrderDetialsOnListOrderOffers());
                                                  },
                                                  child: Text(
                                                    "82-التفاصيل".tr,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          AppColors.yellowColor,
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      fontSize: 14.sp,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )
                                              ])
                                            ])),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 1.h,
                                      color: AppColors.balckColorTypeFour,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 00.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            homeController.dataListOffers[index]
                                                .date_order_user
                                                .toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColors.balckColorTypeThree,
                                              fontFamily: AppTextStyles.Almarai,
                                              fontSize: 16.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            homeController.dataListOffers[index]
                                                .time_order_user
                                                .toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColors.balckColorTypeThree,
                                              fontFamily: AppTextStyles.Almarai,
                                              fontSize: 16.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              : Center(
                  child: TextCustom(
                      theText: "83-يتم التحميل..قد لاتمتلك اي طلبيات لعرضها".tr,
                      fontSizeWidth: 16.sp,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor: AppColors.theAppColorYellow)));
    });
  }
}
