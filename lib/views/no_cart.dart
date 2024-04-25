import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smoe_app_final/core/constant/images_path.dart';

import '../controllers/home_controller.dart';
import '../core/constant/app_text_styles.dart';
import '../core/constant/appcolors.dart';
import '../customWidgets/custom_padding.dart';
import '../customWidgets/custom_text.dart';

class NoCart extends StatelessWidget {
  const NoCart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.messagenoCart.value,
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
                                  theText:
                                      "280-عزيزي العميل لاتحتوي السلة على اي محتويات"
                                          .tr,
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
                              "281-لايمكنك فتح السلة كونها فارغة من اي محتويات..قم رجاءًا بإضافة عناصر لمشاهدة السلة"
                                  .tr,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              child: InkWell(
                                onTap: () {
                                  controller.BackToHome();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 160.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.yellowColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "202-الاخفاء".tr,
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
                          ],
                        )
                      ]))))
            ])));
  }
}
