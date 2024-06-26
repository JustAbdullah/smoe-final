import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';
import '../../../../customWidgets/custom_container.dart';
import '../../../../customWidgets/custom_container_api.dart';
import '../../../../customWidgets/custom_padding.dart';
import '../../../../customWidgets/custom_text.dart';

class ExtrasSearchingWidgets extends StatefulWidget {
  const ExtrasSearchingWidgets({super.key});

  @override
  State<ExtrasSearchingWidgets> createState() => _ExtrasSearchingWidgetsState();
}

class _ExtrasSearchingWidgetsState extends State<ExtrasSearchingWidgets> {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    homeController.fetchGetextras(homeController
        .dataProductsListSearching[
            homeController.indexTheProductsListSearching.value]
        .id);

    return GetX<HomeController>(
        builder: (controller) => Container(
            width: MediaQuery.sizeOf(context).width,
            color: AppColors.whiteColorTypeOne,
            height: 130.h,
            child: controller.isNotEmptyExtras.value == true
                ? ContainerCustom(
                    heigthContainer: 50,
                    widthContainer: MediaQuery.of(context).size.width,
                    colorContainer: AppColors.whiteColor,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.dataExtrasList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return PaddingCustom(
                              theRight: 5,
                              theLeft: 5,
                              child: GetX<HomeController>(
                                builder: (ThecontrollerN) => InkWell(
                                  onTap: () {
                                    if (ThecontrollerN.chosedTheExtras.containsKey(
                                        "${ThecontrollerN.dataExtrasList[index].id}")) {
                                      ThecontrollerN.PriceProducts.value =
                                          ThecontrollerN.PriceProducts.value -
                                              int.parse(ThecontrollerN
                                                  .dataExtrasList[index].price);

                                      ThecontrollerN.Itme();

                                      ThecontrollerN.chosedTheExtras.remove(
                                          "${ThecontrollerN.dataExtrasList[index].id}");
                                    } else {
                                      ThecontrollerN.PriceProducts.value =
                                          ThecontrollerN.PriceProducts.value +
                                              int.parse(ThecontrollerN
                                                  .dataExtrasList[index].price);
                                      ThecontrollerN.Itme();
                                      ThecontrollerN.chosedTheExtras[controller
                                              .dataExtrasList[index].id] =
                                          controller.dataExtrasList[index].idEx;

                                      setState(() {});
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: controller.chosedTheExtras.containsKey(
                                              "${controller.dataExtrasList[index].id}")
                                          ? AppColors.yellowColor
                                          : AppColors.whiteColorTypeOne,
                                    ),
                                    height: 50.h,
                                    width: 70.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w),
                                          child: Text(
                                            controller
                                                .dataExtrasList[index].name
                                                .toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColors.balckColorTypeThree,
                                              fontFamily: AppTextStyles.Almarai,
                                              fontSize: 14.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextCustom(
                                              theText: controller
                                                  .dataExtrasList[index].price
                                                  .toString(),
                                              fontColor:
                                                  AppColors.balckColorTypeThree,
                                              fontFamily: AppTextStyles.Almarai,
                                              fontSizeWidth: 12,
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            TextCustom(
                                              theText: "17-ريال".tr,
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
                                ),
                              ));
                        }),
                  )
                : ContainerCustom(
                    heigthContainer: 120,
                    widthContainer: MediaQuery.of(context).size.width,
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
                                      colorContainer:
                                          AppColors.whiteColorTypeOne,
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
                                        baseColor:
                                            Color.fromARGB(31, 83, 82, 82),
                                        highlightColor: AppColors.whiteColor,
                                        enabled: true,
                                        child: TextCustom(
                                          theText: "18-يتم التحميل".tr,
                                          fontColor: AppColors.whiteColor,
                                          fontFamily: AppTextStyles.Marhey,
                                          fontSizeWidth: 15,
                                        )),
                                  ])));
                        }))));
  }
}
