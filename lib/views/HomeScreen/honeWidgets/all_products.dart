import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../../customWidgets/custom_cachednetworkimage.dart';
import '../../../customWidgets/custom_container.dart';
import '../../../customWidgets/custom_container_api.dart';
import '../../../customWidgets/custom_padding.dart';
import '../../../customWidgets/custom_text.dart';

class AllProductd extends StatelessWidget {
  const AllProductd({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Obx(() {
      return homeController.isNotEmptyProducrs.value == true
          ? LimitedBox(
              maxHeight: 400.h,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: homeController.dataProductsList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: PaddingCustom(
                        theBottom: 10,
                        child: InkWell(
                          onTap: () {
                            homeController.goToDetailsProducts(index);
                          },
                          child: ContainerCustom(
                            theBorderRadius: 5,
                            colorContainer: AppColors.whiteColor,
                            heigthContainer: 130,
                            widthContainer: MediaQuery.sizeOf(context).width,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: CustomCachedNetworkImage(
                                          urlTheImage: homeController
                                              .dataProductsList[index].img
                                              .toString(),
                                          width: 150,
                                          height: 100,
                                          circular: 10,
                                          boxFit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        children: [
                                          TextCustom(
                                            theText: homeController
                                                .dataProductsList[index].price
                                                .toString(),
                                            fontColor:
                                                AppColors.balckColorTypeFour,
                                            fontFamily: AppTextStyles.Marhey,
                                            fontSizeWidth: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          TextCustom(
                                            theText: "17-ريال".tr,
                                            fontColor:
                                                AppColors.balckColorTypeFour,
                                            fontFamily: AppTextStyles.Marhey,
                                            fontSizeWidth: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        PaddingCustom(
                                          theTop: 5,
                                          child: SizedBox(
                                            width: 150.w,
                                            child: Text(
                                                homeController
                                                    .dataProductsList[index]
                                                    .name
                                                    .toString(),
                                                style: TextStyle(
                                                  color: AppColors.yellowColor,
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 150.w,
                                          child: PaddingCustom(
                                            theTop: 2,
                                            child: Text(
                                                homeController
                                                    .dataProductsList[index]
                                                    .about
                                                    .toString(),
                                                maxLines: 3,
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    height: 1.7.h,
                                                    color: AppColors
                                                        .balckColorTypeThree,
                                                    fontFamily:
                                                        AppTextStyles.Almarai),
                                                textAlign: TextAlign.center,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
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
                                              fontColor: AppColors.blackColor,
                                              fontFamily: AppTextStyles.Almarai,
                                              fontSizeWidth: 16,
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            TextCustom(
                                              theText: "18-يتم التحميل",
                                              fontColor: AppColors.redColor,
                                              fontFamily: AppTextStyles.Almarai,
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
                                          "18-يتم التحميل",
                                          maxLines: 4,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              height: 1.7.h,
                                              color:
                                                  AppColors.balckColorTypeThree,
                                              fontFamily:
                                                  AppTextStyles.Almarai),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
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
                                                "18-يتم التحميل",
                                                style: TextStyle(
                                                  color: AppColors.blackColor,
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
                                        fontColor: AppColors.theAppColorYellow,
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
              });
    });
  }
}
