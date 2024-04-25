import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';


import '../../../../../controllers/home_controller.dart';
import '../../../../../core/constant/app_text_styles.dart';
import '../../../../../core/constant/appcolors.dart';
import '../../../../../core/constant/images_path.dart';
import '../../../../../customWidgets/custom_container.dart';
import '../../../../../customWidgets/custom_container_api.dart';
import '../../../../../customWidgets/custom_padding.dart';
import '../../../../../customWidgets/custom_text.dart';

class CartOrder extends StatelessWidget {
  const CartOrder({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Obx(() {
      return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200.h,
          child: homeController.isNotEmptyListOFOrderCart.value == true
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: homeController.dataOrderListCart.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "217-رقم الطلبية:".tr,
                                    style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 57, 57, 57)
                                              .withOpacity(0.6),
                                      fontFamily: AppTextStyles.Almarai,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        homeController.dataOrderListCart[index]
                                            .order_number,
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                                  255, 57, 57, 57)
                                              .withOpacity(0.6),
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]) //
                            ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "221-إجمالي السعر:".tr,
                                    style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 57, 57, 57)
                                              .withOpacity(0.6),
                                      fontFamily: AppTextStyles.Almarai,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        homeController
                                            .dataOrderListCart[index].total,
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                                  255, 57, 57, 57)
                                              .withOpacity(0.6),
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        "17-ريال".tr,
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                                  255, 57, 57, 57)
                                              .withOpacity(0.6),
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]) //
                            ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "207-تاريخ ووقت الطلب:".tr,
                                    style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 57, 57, 57)
                                              .withOpacity(0.6),
                                      fontFamily: AppTextStyles.Almarai,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        homeController.dataOrderListCart[index]
                                            .date_order_user,
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                                  255, 57, 57, 57)
                                              .withOpacity(0.6),
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3.w,
                                      ),
                                      Text(
                                        homeController.dataOrderListCart[index]
                                            .time_order_user,
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                                  255, 57, 57, 57)
                                              .withOpacity(0.6),
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]) //
                            ),
                      ],
                    );
                  },
                )
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Shimmer.fromColors(
                        baseColor: Color.fromARGB(31, 83, 82, 82),
                        highlightColor: AppColors.whiteColor,
                        enabled: true,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          child: PaddingCustom(
                            theBottom: 10,
                            child: ContainerCustom(
                              theBorderRadius: 10,
                              colorContainer: AppColors.whiteColor,
                              heigthContainer: 130,
                              widthContainer: MediaQuery.sizeOf(context).width,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Image.asset(
                                                "${ImagesPath.LogoApp}",
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Row(
                                              children: [
                                                TextCustom(
                                                  theText: "SAR",
                                                  fontColor:
                                                      AppColors.blackColor,
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  fontSizeWidth: 16,
                                                ),
                                                SizedBox(
                                                  width: 4.w,
                                                ),
                                                TextCustom(
                                                  theText: "يتم التحميل",
                                                  fontColor: AppColors.redColor,
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  fontSizeWidth: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: PaddingCustom(
                                            theTop: 30,
                                            child: TextCustom(
                                              theText: "18-يتم التحميل".tr,
                                              fontColor: AppColors.blackColor,
                                              fontFamily: AppTextStyles.Almarai,
                                              fontSizeWidth: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 150.w,
                                          height: 100.h,
                                          child: PaddingCustom(
                                            theTop: 15,
                                            child: Text(
                                              "18-يتم التحميل".tr,
                                              maxLines: 4,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  height: 1.7.h,
                                                  color: AppColors
                                                      .balckColorTypeThree,
                                                  fontFamily:
                                                      AppTextStyles.Almarai),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.h),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: PaddingCustom(
                                              theTop: 5,
                                              child: ContainerCustomApi(
                                                colorContainer:
                                                    AppColors.theAppColorYellow,
                                                theBorderRadius: 15,
                                                heigthContainer: 15.h,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8.h),
                                                  child: Text(
                                                    "18-يتم التحميل".tr,
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.blackColor,
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextCustom(
                                            theText: "0.0",
                                            fontColor:
                                                AppColors.theAppColorYellow,
                                            fontFamily: AppTextStyles.Marhey,
                                            fontSizeWidth: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ));
                  }));
    });
  }
}
