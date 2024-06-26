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
import 'number_phone.dart';

class NameAuth extends StatelessWidget {
  const NameAuth({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.whiteColorTypeOne,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 150.h,
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
                    "264-لقد أوشكت على الانتهاء! فقط قم بإدخال أسمك لإكمال العملية"
                        .tr,
                    style: TextStyle(
                        height: 1.5.h,
                        fontSize: 15.5.sp,
                        fontFamily: AppTextStyles.Almarai,
                        color: AppColors.balckColorTypeThree),
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
                height: 10.h,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Text(
                    "265-عزيزي العميل أدخل أسمك هنا".tr,
                    style: TextStyle(
                        height: 1.5.h,
                        fontSize: 17.5.sp,
                        fontFamily: AppTextStyles.Almarai,
                        color: AppColors.balckColorTypeThree),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.w),
                child: TextFormFiledCustom(
                  labelData: "266-اسم المستخدم".tr,
                  hintData: "267-لطفًا أدخل اسمك هنا".tr,
                  iconData: Icons.person,
                  controllerData: homeController.TheNameTextController,
                  value: (value) {
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                        overlays: []);
                    homeController.TheNameEnter = value.toString();
                    return value;
                  },
                  fillColor: AppColors.whiteColor,
                  hintColor: AppColors.theAppColorYellow,
                  iconColor: AppColors.theAppColorYellow,
                  borderSideColor:
                      AppColors.balckColorTypeThree.withOpacity(0.3),
                  fontColor: AppColors.balckColorTypeThree,
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  autofillHints: [AutofillHints.name],
                  onChanged: (value) {
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                        overlays: []);
                    homeController.TheNameEnter = value.toString();
                    return value;
                  },
                  validator: (value) {},
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              InkWell(
                onTap: () {
                  homeController.SignUp(
                    homeController.TheNameEnter.toString(),
                    homeController.theNumber.value.toString(),
                  );
                },
                child: ContainerCustom(
                  colorContainer: AppColors.theAppColorYellow,
                  widthContainer: 200,
                  heigthContainer: 40,
                  child: TextCustom(
                      theText: "268-الإنهاء".tr,
                      fontSizeWidth: 16,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor: AppColors.balckColorTypeFour),
                ),
              ),
            ]),
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
                          "269-يتم التحقق الان".tr,
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
                              "270-لقد اتممت التحقق بنجاح ,,يمكنك الان من إدخال الاسم من أجل إكمال إنشاء الحساب ,شُكرا على صبرك"
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
                                    theText: "271-التوجة الان".tr,
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
                              "272-عزيزي المستخدم هناك إشكالية,,الرجاء  المحاولة مجددًا لاحقًا"
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

                                Get.to(NumberPhone());
                              },
                              child: ContainerCustom(
                                widthContainer: 200.w,
                                heigthContainer: 30,
                                colorContainer: AppColors.theAppColorYellow,
                                child: Center(
                                  child: TextCustom(
                                      theText: "273-الاخفاء".tr,
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
