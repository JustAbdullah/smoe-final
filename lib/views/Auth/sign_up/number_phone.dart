import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:lottie/lottie.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../../customWidgets/custom_container.dart';
import '../../../customWidgets/custom_padding.dart';
import '../../../customWidgets/custom_text.dart';
import '../login/number_phone_login.dart';
import 'otp_number.dart';

class NumberPhone extends StatelessWidget {
  const NumberPhone({super.key});

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
              key: homeController.formSignPhoneAndName,
              child: Column(children: [
                SizedBox(
                  height: 80.h,
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
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Text(
                      "254-يُسرنا إختيارك ورغبتك للانضمام لتطبيقنا للتمتع بمختلف المزايا المُقدمة لك"
                          .tr,
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
                  height: 60.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Text(
                      "238-رجاءًا قم بإدخال رقم الهاتف في الحقل التالي  للتقدم"
                          .tr,
                      style: TextStyle(
                          height: 1.5.h,
                          fontSize: 17.sp,
                          fontFamily: AppTextStyles.Almarai,
                          color:
                              AppColors.balckColorTypeThree.withOpacity(0.6)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: SizedBox(
                    width: 300.w,
                    height: 50.h,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: InternationalPhoneNumberInput(
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          setSelectorButtonAsPrefixIcon: true,
                          leadingPadding: 20,
                          useEmoji: true,
                        ),
                        onInputChanged: (PhoneNumber number) {
                          SystemChrome.setEnabledSystemUIMode(
                              SystemUiMode.manual,
                              overlays: []);
                          homeController.theNumber.value =
                              number.phoneNumber.toString();
                          print(number.phoneNumber);
                        },
                        onInputValidated: (bool value) {
                          SystemChrome.setEnabledSystemUIMode(
                              SystemUiMode.manual,
                              overlays: []);
                        },
                        initialValue: PhoneNumber(isoCode: 'YE'),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle: TextStyle(color: Colors.black),
                        textFieldController: homeController.phoneController,
                        formatInput: true,
                        keyboardType: TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        inputBorder: OutlineInputBorder(),
                        onSaved: (PhoneNumber number) {
                          //   homeController.theNumber.value = number.;
                          print('On Saved: $number');
                        },
                      ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "255-بالفعل لديك حساب؟".tr,
                          style: TextStyle(
                              height: 1.5.h,
                              fontSize: 13.5.sp,
                              fontFamily: AppTextStyles.Almarai,
                              color: AppColors.balckColorTypeThree),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        InkWell(
                          onTap: () {
                            Get.offAll(const NumberPhoneLogin());
                          },
                          child: Text(
                            "256-قم بالتزامن الان".tr,
                            style: TextStyle(
                                height: 1.5.h,
                                fontSize: 13.5.sp,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.theAppColorYellow,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 0.3.h,
                    color: AppColors.blackColorTypeTeo,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Text(
                      "257-عند الضغط على الزر سيتم التحقق من  رقم الهاتف  قبل إكمال عملية الإنضمام,,رجاءًا تحلى بالصبر"
                          .tr,
                      style: TextStyle(
                          height: 1.5.h,
                          fontSize: 12.5.sp,
                          fontFamily: AppTextStyles.Almarai,
                          color:
                              AppColors.balckColorTypeThree.withOpacity(0.5)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                InkWell(
                  onTap: () {
                    homeController
                        .verifyPhoneNumber(homeController.theNumber.value);
                  },
                  child: ContainerCustom(
                    colorContainer: AppColors.theAppColorYellow,
                    widthContainer: 260,
                    heigthContainer: 40,
                    child: TextCustom(
                        theText: "258-التحقق الان".tr,
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
                        Lottie.asset(ImagesPath.loadingAnimation, width: 190.w),
                        Text(
                          "259-انتظر قليلاً يتم التحقق الان".tr,
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
                  visible: controller.isAddTheUser.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddTheUser.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddTheUser.value,
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
                              "260-تم بنجاح التحقق انقر للتقدم وإكمال عملية الإنضمام"
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
                              homeController.cleanWaitScreenAuthSignUp();
                              Get.to(CodeNumber());
                            },
                            child: ContainerCustom(
                              widthContainer: 200.w,
                              heigthContainer: 30,
                              colorContainer: AppColors.theAppColorYellow,
                              child: Center(
                                child: TextCustom(
                                    theText: "261-التوجة الان".tr,
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
                  visible: controller.ErrorAboutNumber.value ||
                      controller.isErrorAboutEnterOTP.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.ErrorAboutNumber.value ||
                      controller.isErrorAboutEnterOTP.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.ErrorAboutNumber.value ||
                      controller.isErrorAboutEnterOTP.value,
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
                              "262-عزيزي المستخدم هناك إشكالية,,الرجاء إعادة المحاولة مرة أخرى"
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
                              },
                              child: ContainerCustom(
                                widthContainer: 200.w,
                                heigthContainer: 30,
                                colorContainer: AppColors.theAppColorYellow,
                                child: Center(
                                  child: TextCustom(
                                      theText: "263-الاخفاء".tr,
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
