import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smoe_app_final/core/constant/images_path.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../customWidgets/custom_padding.dart';
import '../../../../customWidgets/custom_text.dart';

class AddIntoListCart extends StatelessWidget {
  const AddIntoListCart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.MessageAddedIntoList.value,
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black38,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: 300.w,
                      height: 220.h,
                      color: Colors.white,
                      child: SingleChildScrollView(
                          child: Column(children: [
                        PaddingCustom(
                            theTop: 10.h,
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: Lottie.asset(
                                  ImagesPath.success,
                                  width: 80.w,
                                ))),
                        PaddingCustom(
                            theTop: 20.h,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: TextCustom(
                                  theText: "لقد تم إضافة المنتج إلى السلة",
                                  fontSizeWidth: 17.sp,
                                  fontFamily: AppTextStyles.Almarai,
                                  fontColor: AppColors.balckColorTypeFour),
                            )),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              "يمكنك الإطلاع على قائمة السلة للإطلاع على المحتويات وتاكيد الطلبية",
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontFamily: AppTextStyles.Almarai,
                                  color:
                                      const Color.fromARGB(255, 108, 108, 108)),
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              child: InkWell(
                                onTap: () {
                                  controller.BackToHome();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 100.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.yellowColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "الاخفاء",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeFour),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              child: InkWell(
                                onTap: () {
                                  controller.BackToHome();
                                  controller.fetchProductsDataCart();
                                  controller.showCart.value = true;
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 100.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.redColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "مشاهدة السلة",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.whiteColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ]))))
            ])));
  }
}
