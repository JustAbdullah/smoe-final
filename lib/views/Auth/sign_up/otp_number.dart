import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../../customWidgets/custom_container.dart';
import '../../../customWidgets/custom_padding.dart';
import '../../../customWidgets/custom_text.dart';
import '../../../customWidgets/custome_textfiled.dart';
import '../../WelcomeScreen/welcome_screen.dart';

class CodeNumber extends StatelessWidget {
  const CodeNumber({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: homeController.formSignPassword,
              child: Column(children: [
                SizedBox(
                  height: 100.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: TextCustom(
                      fontWeight: FontWeight.bold,
                      theText: "248-الإنضمام للتطبيق".tr,
                      fontSizeWidth: 23,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor: AppColors.theAppColorYellow),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Text(
                      "249-نشكرك على طلب الإنضمام الرجاء إكمال التالي".tr,
                      style: TextStyle(
                          height: 1.5.h,
                          fontSize: 15.5.sp,
                          fontFamily: AppTextStyles.Almarai,
                          color:
                              AppColors.balckColorTypeThree.withOpacity(0.5)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Text(
                      "${homeController.theNumber.value.toString()} ",
                      style: TextStyle(
                          height: 1.5.h,
                          fontSize: 15.5.sp,
                          fontFamily: AppTextStyles.Cairo,
                          color: AppColors.redColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Text(
                      "250-عليك إدخال كود التحقق المرسل إلى رقمك بالأعلى..".tr,
                      style: TextStyle(
                          height: 1.5.h,
                          fontSize: 17.sp,
                          fontFamily: AppTextStyles.Almarai,
                          color:
                              AppColors.balckColorTypeThree.withOpacity(0.7)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70.w),
                  child: TextFormFiledCustom(
                    labelData: "228-كود التحقق".tr,
                    hintData: "229-لطفًا أدخل كود التحقق".tr,
                    iconData: Icons.copy_rounded,
                    controllerData: homeController.TheCodeTextController,
                    value: (value) {
                      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                          overlays: []);
                      homeController.theCodeString = value.toString();
                      return value;
                    },
                    fillColor: AppColors.whiteColor,
                    hintColor: AppColors.theAppColorYellow,
                    iconColor: AppColors.theAppColorYellow,
                    borderSideColor:
                        AppColors.balckColorTypeThree.withOpacity(0.3),
                    fontColor: AppColors.balckColorTypeThree,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    autofillHints: [AutofillHints.password],
                    onChanged: (value) {
                      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                          overlays: []);
                      homeController.theCodeString = value.toString();
                      return value;
                    },
                    validator: (value) {},
                  ),
                ),
                SizedBox(
                  height: 120.h,
                ),
                InkWell(
                  onTap: () {
                    homeController.signInWithPhoneNumber(
                      homeController.verificationIdSaved.toString(),
                      homeController.theCodeString.toString(),
                    );
                  },
                  child: ContainerCustom(
                    colorContainer: AppColors.theAppColorYellow,
                    widthContainer: 200,
                    heigthContainer: 40,
                    child: TextCustom(
                        theText: "230-المتابعة".tr,
                        fontSizeWidth: 16,
                        fontFamily: AppTextStyles.Almarai,
                        fontColor: AppColors.balckColorTypeFour),
                  ),
                ),
              ]),
            ),
          ),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.waitCheckNumber.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.waitCheckNumber.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.waitCheckNumber.value,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset(ImagesPath.loadingAnimation, width: 140.w),
                        Text(
                          "231-يتم التحقق الان".tr,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontFamily: AppTextStyles.Almarai,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isEndOTP.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isEndOTP.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isEndOTP.value,
                  child: PaddingCustom(
                    theTop: 190.h,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(ImagesPath.success, width: 140.w),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              "251-لقد اتممت التحقق بنجاح ,,يمكنك الان من إدخال الاسم من أجل إكمال إنشاء الحساب ,شُكرا على صبرك"
                                  .tr,
                              style: TextStyle(
                                height: 1.7.h,
                                color: AppColors.whiteColor,
                                fontFamily: AppTextStyles.Almarai,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          InkWell(
                            onTap: () {
                              homeController.goToHomeLoginSignUp();
                            },
                            child: ContainerCustom(
                              widthContainer: 200.w,
                              heigthContainer: 30,
                              colorContainer: AppColors.theAppColorYellow,
                              child: Center(
                                child: TextCustom(
                                    theText: "252-التوجة الان".tr,
                                    fontSizeWidth: 20,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.balckColorTypeThree),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isErrorInOTP.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isErrorInOTP.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isErrorInOTP.value,
                  child: PaddingCustom(
                    theTop: 190.h,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(ImagesPath.error, width: 140.w),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              "253-عزيزي المستخدم هناك إشكالية,,الرجاء المحاولة مجددًا لاحقًا"
                                  .tr,
                              style: TextStyle(
                                height: 1.7.h,
                                color: AppColors.whiteColor,
                                fontFamily: AppTextStyles.Almarai,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          InkWell(
                              onTap: () {
                                homeController.cleanTheSignUp();

                                Get.to(WelcomeScreen());
                              },
                              child: ContainerCustom(
                                widthContainer: 200.w,
                                heigthContainer: 30,
                                colorContainer: AppColors.theAppColorYellow,
                                child: Center(
                                  child: TextCustom(
                                      theText: "247-الاخفاء".tr,
                                      fontSizeWidth: 20,
                                      fontFamily: AppTextStyles.Almarai,
                                      fontColor: AppColors.balckColorTypeThree),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ))),
        ],
      )),
    );
  }
}
