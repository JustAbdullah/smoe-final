import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../core/constant/images_path.dart';
import '../../customWidgets/custom_padding.dart';
import '../Auth/login/number_phone_login.dart';
import '../HomeScreen/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.theAppColorYellow,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(children: [
            SizedBox(
              height: 80.h,
            ),
            Text(
              "274-مرحبًا بك في تطبيق سموي".tr,
              style: TextStyle(
                  fontFamily: AppTextStyles.Almarai,
                  color: AppColors.blackColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Text(
                "275-يوصلك ساخن على الاخر وباجمل مذاق".tr,
                style: TextStyle(
                    fontFamily: AppTextStyles.Almarai,
                    color: AppColors.blackColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: PaddingCustom(
                theTop: 00,
                child: Lottie.asset(
                  "${ImagesPath.Welcome}",
                ),
              ),
            ),
            SizedBox(
              height: 59.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Text(
                "276-قم بإختيار أحد المسارات التالية".tr,
                style: TextStyle(
                    fontFamily: AppTextStyles.Almarai,
                    color: AppColors.blackColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 19.h,
            ),
            InkWell(
              onTap: () {
                Get.to(NumberPhoneLogin());
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.redColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: 220.w,
                height: 35.h,
                child: Text(
                  "277-تسجيل الدخول".tr,
                  style: TextStyle(
                      fontFamily: AppTextStyles.Almarai,
                      color: AppColors.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                Get.to(HomeScreen());
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: 220.w,
                height: 35.h,
                child: Text(
                  "278-المتابعة كزائر".tr,
                  style: TextStyle(
                      fontFamily: AppTextStyles.Almarai,
                      color: AppColors.balckColorTypeFour,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ]),
        ),
      )),
    );
  }
}
