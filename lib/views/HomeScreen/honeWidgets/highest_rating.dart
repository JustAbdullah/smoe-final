import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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

class HighestRating extends StatelessWidget {
  const HighestRating({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return FutureBuilder(
        future: homeController.getDataProductsFromDatabase(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return homeController.noDataProduct.value == true
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(ImagesPath.noData, width: 200.w),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextCustom(
                            theText: "لايوجد منتجات في هذا الفرع ",
                            fontSizeWidth: 15,
                            fontFamily: AppTextStyles.Almarai,
                            fontWeight: FontWeight.bold,
                            fontColor: AppColors.TheMain),
                      ],
                    ),
                  )
                : ContainerCustom(
                    heigthContainer: 200,
                    widthContainer: MediaQuery.sizeOf(context).width,
                    colorContainer: AppColors.whiteColorTypeOne,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data['data'].length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.h),
                            child: PaddingCustom(
                              theBottom: 10,
                              child: ContainerCustom(
                                theBorderRadius: 5,
                                colorContainer: AppColors.whiteColor,
                                heigthContainer: 130,
                                widthContainer:
                                    MediaQuery.sizeOf(context).width,
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
                                                child: CustomCachedNetworkImage(
                                                  urlTheImage: snapshot
                                                      .data['data'][i]
                                                          ['products_image']
                                                      .toString(),
                                                  width: 100,
                                                  height: 100,
                                                  boxFit: BoxFit.contain,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Row(
                                                children: [
                                                  TextCustom(
                                                    theText:
                                                        snapshot.data['data'][i]
                                                            ['products_price'],
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
                                                    theText: "ريال",
                                                    fontColor:
                                                        AppColors.blackColor,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    fontSizeWidth: 16,
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
                                                theText: snapshot.data['data']
                                                    [i]['prooduct_name_ar'],
                                                fontColor: AppColors.blackColor,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
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
                                                "${snapshot.data['data'][i]['prooduct_description_ar']}",
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
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: PaddingCustom(
                                                theTop: 5,
                                                child: ContainerCustomApi(
                                                  colorContainer: AppColors
                                                      .theAppColorYellow,
                                                  theBorderRadius: 15,
                                                  heigthContainer: 15.h,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8.h),
                                                    child: Text(
                                                      "معجنات",
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .blackColor,
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TextCustom(
                                              theText: homeController
                                                  .nameBranch.value,
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
                          );
                        }),
                  );
          } else {
            return ListView.builder(
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
                                            theText: "يتم التحميل",
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
                                            "يتم التحميل",
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
                                                  "يتم التحميل",
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
                });
          }
        });
  }
}
