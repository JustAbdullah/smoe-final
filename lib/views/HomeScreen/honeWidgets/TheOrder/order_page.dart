import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';
import '../../../../customWidgets/custom_cachednetworkimage.dart';
import '../../../../customWidgets/custom_container.dart';
import '../../../../customWidgets/custom_container_api.dart';
import '../../../../customWidgets/custom_padding.dart';
import '../../../../customWidgets/custom_text.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Obx(() {
      return Container(
          width: MediaQuery.sizeOf(context).width,
          child: homeController.isNotEmptyListOFOrder.value
              ? ContainerCustom(
                  heigthContainer: 500.h,
                  widthContainer: MediaQuery.of(context).size.width,
                  colorContainer: AppColors.whiteColor,
                  child: ListView.builder(
                      itemCount: homeController.dataOrderList.length,
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
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "رقم الطلبية:",
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
                                              .dataOrderList[index].order_number
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "إجمالي الطلبية:",
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
                                                  .dataOrderList[index].total
                                                  .toString(),
                                              fontColor: const Color.fromARGB(
                                                  255, 30, 105, 34),
                                              fontFamily: AppTextStyles.Almarai,
                                              fontSizeWidth: 14,
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            TextCustom(
                                              theText: "ريال",
                                              fontColor:
                                                  AppColors.balckColorTypeThree,
                                              fontFamily: AppTextStyles.Almarai,
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
                                              "حالة الطلبية:",
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
                                                            .dataOrderList[
                                                                index]
                                                            .order_status ==
                                                        3
                                                    ? "تم التسليم"
                                                    : "مراجعة",
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
                                                child: Text(
                                                  "التفاصيل",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 00.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          homeController.dataOrderList[index]
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
                                          homeController.dataOrderList[index]
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
                        );
                      }),
                )
              : ContainerCustom(
                  heigthContainer: 120,
                  widthContainer: 1300,
                  colorContainer: AppColors.whiteColorTypeOne,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return Shimmer.fromColors(
                            baseColor: Color.fromARGB(31, 83, 82, 82),
                            highlightColor: AppColors.whiteColor,
                            enabled: true,
                            child: PaddingCustom(
                                theRight: 1,
                                theLeft: 1,
                                child: Column(children: [
                                  ContainerCustomApi(
                                    colorContainer: AppColors.whiteColorTypeOne,
                                    boxShape: BoxShape.circle,
                                    heigthContainer: 70.h,
                                    child: Image.asset(
                                      "${ImagesPath.LogoApp}",
                                      width: 80,
                                      height: 100,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 19.h,
                                  ),
                                  Shimmer.fromColors(
                                      baseColor: Color.fromARGB(31, 83, 82, 82),
                                      highlightColor: AppColors.whiteColor,
                                      enabled: true,
                                      child: TextCustom(
                                        theText: "يتم التحميل",
                                        fontColor: AppColors.whiteColor,
                                        fontFamily: AppTextStyles.Marhey,
                                        fontSizeWidth: 15,
                                      )),
                                ])));
                      })));
    });
  }
}
