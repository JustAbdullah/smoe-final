import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smoe_app_final/controllers/home_controller.dart';

import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/localization/changelanguage.dart';
import '../../../../customWidgets/custom_padding.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeLanguageToLocale changeLanguageToLocale =
        Get.put(ChangeLanguageToLocale());
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.showLang.value,
            child: Container(
                color: AppColors.whiteColor,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PaddingCustom(
                          theTop: 140.h,
                          child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Text(
                                  "56-عزيزي العميل..يتم أخذ لغه التطبيق الرئيسي عن طريق إستخدام لغة جهازك المُعتمدة في حال أردت تغيير اللغة أختر أحد الخيارات المتاحة"
                                      .tr,
                                  style: TextStyle(
                                      height: 1.3.h,
                                      fontSize: 16,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.balckColorTypeFour),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                        InkWell(
                          onTap: () {
                            changeLanguageToLocale.changeLang("ar");
                          },
                          child: Container(
                            height: 40.h,
                            decoration: BoxDecoration(
                                color: AppColors.yellowColor,
                                borderRadius: BorderRadius.circular(7)),
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.w, vertical: 10.h),
                                child: Text(
                                  "56-اللغة العربية-الأختيار".tr,
                                  style: TextStyle(
                                      height: 1.6.h,
                                      fontSize: 15,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.TheMain),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        InkWell(
                          onTap: () {
                            changeLanguageToLocale.changeLang("en");
                          },
                          child: Container(
                            height: 40.h,
                            decoration: BoxDecoration(
                                color: AppColors.yellowColor,
                                borderRadius: BorderRadius.circular(7)),
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.w, vertical: 10.h),
                                child: Text(
                                  "57-اللغة الانجليزية-الأختيار".tr,
                                  style: TextStyle(
                                      height: 1.6.h,
                                      fontSize: 15,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.TheMain),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 200.h,
                        ),
                        InkWell(
                          onTap: () {
                            controller.showLang.value = false;
                          },
                          child: Container(
                            height: 40.h,
                            decoration: BoxDecoration(
                                color: AppColors.theAppColorYellow,
                                borderRadius: BorderRadius.circular(7)),
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 60.w, vertical: 10.h),
                                child: Text(
                                  "58-الإنتقال".tr,
                                  style: TextStyle(
                                      height: 1.6.h,
                                      fontSize: 15,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.whiteColor),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        )
                      ]),
                ))));
  }
}
