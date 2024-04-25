import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smoe_app_final/core/constant/images_path.dart';
import 'package:smoe_app_final/customWidgets/custom_padding.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../customWidgets/custom_cachednetworkimage.dart';
import '../../../../customWidgets/custom_text.dart';

class OffersDetails extends StatelessWidget {
  const OffersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.showOffersDetials.value,
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
                  width: 600.w,
                  height: 550.h,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            controller.BackToHome();
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
                                theText: "29-تفاصيل العرض".tr,
                                fontSizeWidth: 20,
                                fontFamily: AppTextStyles.Almarai,
                                fontColor: AppColors.balckColorTypeFour),
                          )),
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomCachedNetworkImage(
                        circular: 10,
                        urlTheImage: controller
                            .dataOffersList[
                                controller.indexTheOfferssList.value]
                            .img
                            .toString(),
                        width: 300.w,
                        height: 200.h,
                        boxFit: BoxFit.cover,
                      ),
                      PaddingCustom(
                          theTop: 20.h,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: TextCustom(
                                theText: controller
                                    .dataOffersList[
                                        controller.indexTheOfferssList.value]
                                    .name
                                    .toString(),
                                fontSizeWidth: 22,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppTextStyles.Almarai,
                                fontColor: AppColors.yellowColor),
                          )),
                      PaddingCustom(
                          theTop: 24.h,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextCustom(
                                    theText: controller
                                        .dataOffersList[controller
                                            .indexTheOfferssList.value]
                                        .price
                                        .toString(),
                                    fontSizeWidth: 17,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.balckColorTypeFour),
                                TextCustom(
                                    theText: "17-ريال".tr,
                                    fontSizeWidth: 17,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.balckColorTypeFour),
                              ],
                            ),
                          )),
                      PaddingCustom(
                          theTop: 27.h,
                          theLeft: 10.w,
                          theRight: 10.w,
                          child: Row(
                            children: [
                              Align(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 150.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.yellowColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "20-الوصف".tr,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeFour),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      PaddingCustom(
                          theTop: 15.h,
                          theLeft: 10.w,
                          theRight: 10.w,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              controller
                                  .dataOffersList[
                                      controller.indexTheOfferssList.value]
                                  .about
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour),
                              textAlign: TextAlign.center,
                            ),
                          )),
                      PaddingCustom(
                          theTop: 27.h,
                          theLeft: 10.w,
                          theRight: 10.w,
                          child: Row(
                            children: [
                              Align(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 150.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.balckColorTypeFour,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "23-الكمية والطلب".tr,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.whiteColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      PaddingCustom(
                          theTop: 24.h,
                          theBottom: 20.h,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {
                                      controller.MusnheItmeOffers();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 40.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                          color: AppColors.redColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Image.asset(ImagesPath.minus),
                                    )),
                                SizedBox(
                                  width: 10.w,
                                ),
                                TextCustom(
                                    theText: controller
                                        .TheNumberOfItmeOffers.value
                                        .toString(),
                                    fontSizeWidth: 17,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.redColor),
                                SizedBox(
                                  width: 2.w,
                                ),
                                TextCustom(
                                    theText: "24-قطعة".tr,
                                    fontSizeWidth: 17,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.balckColorTypeFour),
                                SizedBox(
                                  width: 10.w,
                                ),
                                InkWell(
                                    onTap: () {
                                      controller.AddTheItmeOffers();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 40.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Image.asset(ImagesPath.plus),
                                    )),
                              ],
                            ),
                          )),
                      PaddingCustom(
                          theTop: 4.h,
                          theBottom: 20.h,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextCustom(
                                    theText: "25-إجمالي السعر:".tr,
                                    fontSizeWidth: 17,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.balckColorTypeFour),
                                SizedBox(
                                  width: 5.w,
                                ),
                                TextCustom(
                                    theText: controller
                                        .theTotalPriceOffers.value
                                        .toString(),
                                    fontSizeWidth: 17,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.redColor),
                                SizedBox(
                                  width: 2.w,
                                ),
                                TextCustom(
                                    theText: "17-ريال".tr,
                                    fontSizeWidth: 17,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.balckColorTypeFour),
                              ],
                            ),
                          )),
                      PaddingCustom(
                          theTop: 27.h,
                          theLeft: 15.w,
                          theRight: 15.w,
                          theBottom: 20.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                child: InkWell(
                                  onTap: () {
                                    controller.addOffer(
                                        controller
                                            .dataOffersList[controller
                                                .indexTheOfferssList.value]
                                            .id
                                            .toString(),
                                        controller.theTotalPriceOffers.value
                                            .toString(),
                                        controller.TheNumberOfItmeOffers.value
                                            .toString());
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 200.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        color: AppColors.yellowColor,
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Text(
                                      "28-إنهاء الطلب".tr,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeFour),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ]),
                  ),
                ),
              ),
            ])));
  }
}
