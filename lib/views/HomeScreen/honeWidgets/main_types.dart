
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

class MainTypes extends StatelessWidget {
  const MainTypes({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return GetX<HomeController>(
        builder: (controller) => controller.isNotEmptyMainType.value
            ? SizedBox(
                height: 80.h,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.dataList.length,
                  itemBuilder: (context, index) {
                    return GetX<HomeController>(
                        builder: (THENEWcontroller) => InkWell(
                            onTap: () {
                              THENEWcontroller.isNotEmptyProducrsByType.value =
                                  false;

                              THENEWcontroller.fetchProductsDataByType(
                                  THENEWcontroller.dataList[index].id
                                      .toString());
                            },
                            child: Column(
                              children: [
                                ContainerCustomApi(
                                  colorContainer: AppColors.whiteColorTypeOne,
                                  heigthContainer: 50.h,
                                  child: CustomCachedNetworkImage(
                                    urlTheImage: homeController
                                        .dataList[index].img
                                        .toString(),
                                    width: 60.w,
                                    height: 50.h,
                                    boxFit: BoxFit.contain,
                                    circular: 5,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                GetX<HomeController>(
                                  builder: (Thecontroller) => TextCustom(
                                    theText: Thecontroller.dataList[index].name
                                        .toString(),
                                    fontColor: Thecontroller.TheType.value ==
                                            int.parse(controller
                                                .dataList[index].id
                                                .toString())
                                        ? AppColors.yellowColor
                                        : AppColors.blackColorTypeTeo,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontSizeWidth: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )));
                  },
                ),
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
                                      theText: "18-يتم التحميل".tr,
                                      fontColor: AppColors.whiteColor,
                                      fontFamily: AppTextStyles.Marhey,
                                      fontSizeWidth: 15,
                                    )),
                              ])));
                    })));
  }
}
