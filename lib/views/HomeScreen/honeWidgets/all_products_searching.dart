import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../customWidgets/custom_cachednetworkimage.dart';
import '../../../customWidgets/custom_container.dart';
import '../../../customWidgets/custom_padding.dart';
import '../../../customWidgets/custom_text.dart';

class AllProductdSearching extends StatelessWidget {
  const AllProductdSearching({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Obx(() {
      return homeController.isNotEmptyProducrsSearching.value == true
          ? LimitedBox(
              maxHeight: 400.h,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:
                      homeController.dataProductsListSearching.length ?? 0,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: PaddingCustom(
                        theBottom: 10,
                        child: InkWell(
                          onTap: () {
                            homeController.goToDetailsProductsSearhcing(index);
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
                                              .dataProductsListSearching[index]
                                              .img
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
                                                .dataProductsListSearching[
                                                    index]
                                                .price
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
                                                    .dataProductsListSearching[
                                                        index]
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
                                                    .dataProductsListSearching[
                                                        index]
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
          : Center(
              child: Text(
              "22-لايوجد بيانات من عملية البحث".tr,
              style: TextStyle(
                  fontSize: 14.sp,
                  height: 1.7.h,
                  color: AppColors.yellowColor,
                  fontFamily: AppTextStyles.Almarai),
              textAlign: TextAlign.center,
            ));
    });
  }
}
