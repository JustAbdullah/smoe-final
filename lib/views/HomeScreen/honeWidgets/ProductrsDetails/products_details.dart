import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smoe_app_final/core/constant/images_path.dart';
import 'package:smoe_app_final/customWidgets/custom_padding.dart';
import 'package:smoe_app_final/views/HomeScreen/honeWidgets/ProductrsDetails/extras.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../customWidgets/custom_cachednetworkimage.dart';
import '../../../../customWidgets/custom_text.dart';

class ProductsDetails extends StatelessWidget {
  const ProductsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.showTheDetailsProduct.value,
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
                                theText: "تفاصيل المنتج",
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
                            .dataProductsList[
                                controller.indexTheProductsList.value]
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
                                    .dataProductsList[
                                        controller.indexTheProductsList.value]
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
                                        .dataProductsList[controller
                                            .indexTheProductsList.value]
                                        .price
                                        .toString(),
                                    fontSizeWidth: 17,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.balckColorTypeFour),
                                TextCustom(
                                    theText: "ريال",
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
                                    "الوصف",
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
                                  .dataProductsList[
                                      controller.indexTheProductsList.value]
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
                                      color: AppColors.yellowColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "الاضافات",
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
                      PaddingCustom(theTop: 17.h, child: ExtrasWidgets()),
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
                                    "الكمية والطلب",
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
                                      controller.MusnheItme();
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
                                    theText: controller.TheNumberOfItme.value
                                        .toString(),
                                    fontSizeWidth: 17,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.redColor),
                                SizedBox(
                                  width: 2.w,
                                ),
                                TextCustom(
                                    theText: "قطعة",
                                    fontSizeWidth: 17,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.balckColorTypeFour),
                                SizedBox(
                                  width: 10.w,
                                ),
                                InkWell(
                                    onTap: () {
                                      controller.AddTheItme();
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
                                    theText: "إجمالي السعر:",
                                    fontSizeWidth: 17,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.balckColorTypeFour),
                                SizedBox(
                                  width: 5.w,
                                ),
                                TextCustom(
                                    theText: controller.theTotalPrice.value
                                        .toString(),
                                    fontSizeWidth: 17,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.redColor),
                                SizedBox(
                                  width: 2.w,
                                ),
                                TextCustom(
                                    theText: "ريال",
                                    fontSizeWidth: 17,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.balckColorTypeFour),
                              ],
                            ),
                          )),
                      PaddingCustom(
                          theTop: 17.h,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: TextCustom(
                                theText:
                                    "يتم إحتساب كل قطعة مضاف إليها الإضافات",
                                fontSizeWidth: 10,
                                fontFamily: AppTextStyles.Almarai,
                                fontColor:
                                    const Color.fromARGB(255, 69, 68, 68)),
                          )),
                      PaddingCustom(
                          theTop: 27.h,
                          theLeft: 15.w,
                          theRight: 15.w,
                          theBottom: 20.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                child: InkWell(
                                  onTap: () async {
                                    controller.generateRandomOrderNumber();
                                    controller.addIntListProducts(
                                        controller.randomNumber.toString(),
                                        controller.theTotalPrice.value
                                            .toString(),
                                        controller
                                            .dataProductsList[controller
                                                .indexTheProductsList.value]
                                            .id
                                            .toString(),
                                        controller.TheNumberOfItme.value
                                            .toString());
                                    controller.MessageAddedIntoList.value =
                                        true;
                                    await Future.delayed(
                                        const Duration(seconds: 3), () async {
                                      controller.chosedTheExtras.isEmpty
                                          ? {}
                                          : {
                                              controller.chosedTheExtras
                                                  .forEach((k, v) {
                                                controller.addIntListProductsEtr(
                                                    controller.randomNumber
                                                        .toString(),
                                                    controller
                                                        .dataProductsList[controller
                                                            .indexTheProductsList
                                                            .value]
                                                        .id
                                                        .toString(),
                                                    v.toString(),
                                                    controller
                                                        .getIdOfListProducts
                                                        .value
                                                        .toString());
                                                print(v.toString());
                                                print("/////////////////");
                                              }),
                                            };
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 150.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        color: AppColors.redColor,
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Text(
                                      "إضافة للسلة",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.whiteColor),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 150.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.yellowColor,
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Text(
                                    "إنهاء الطلب",
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
                    ]),
                  ),
                ),
              ),
            ])));
  }
}
