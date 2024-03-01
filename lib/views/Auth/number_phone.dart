import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:lottie/lottie.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../core/constant/images_path.dart';
import '../../customWidgets/custom_container.dart';
import '../../customWidgets/custom_padding.dart';
import '../../customWidgets/custom_text.dart';
import '../../customWidgets/custome_textfiled.dart';
import 'otp_number.dart';

class NumberPhone extends StatelessWidget {
  const NumberPhone({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.whiteColorTypeOne,
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
                      theText: "الإنضمام للتطبيق",
                      fontSizeWidth: 23,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor: AppColors.blackColorsTypeOne),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Text(
                      "يُسرنا إختيارك ورغبتك للانضمام لتطبيقنا للتمتع بمختلف المزايا المُقدمة لك",
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
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Text(
                      "رجاءًا قم بإدخال رقم الهاتف في الحقل التالي  للتقدم",
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
                          "بالفعل قد أكملت عملية الإنضمام؟",
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
                            Get.offAll(const CodeNumber());
                          },
                          child: Text(
                            "قم بالتزامن الان",
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
                  height: 30.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Text(
                      "عند الضغط على الزر سيتم التحقق من  رقم الهاتف  قبل إكمال عملية الإنضمام,,رجاءًا تحلى بالصبر",
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
                InkWell(
                  onTap: () {
                    homeController
                        .verifyPhoneNumber(homeController.theNumber.value);
                  },
                  child: ContainerCustom(
                    colorContainer: AppColors.theAppColorYellow,
                    widthContainer: 200,
                    heigthContainer: 40,
                    child: TextCustom(
                        theText: "التحقق الان",
                        fontSizeWidth: 16,
                        fontFamily: AppTextStyles.Almarai,
                        fontColor: AppColors.whiteColor),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.w),
                    child: Text(
                      "في حال إنضمامك للتطبيق  فإنك توافق على شروط واحكام منصة تطبيق سموي",
                      style: TextStyle(
                          height: 1.5.h,
                          fontSize: 14.5.sp,
                          fontFamily: AppTextStyles.Almarai,
                          color: AppColors.redColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.w),
                    child: Text(
                      "قراءة الشروط والأحكام",
                      style: TextStyle(
                          height: 1.5.h,
                          fontSize: 14.5.sp,
                          fontFamily: AppTextStyles.Almarai,
                          fontWeight: FontWeight.bold,
                          color: AppColors.theAppColorYellow),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
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
                          "انتظر قليلاً يتم التحقق الان",
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
                              "تم بنجاح التحقق انقر للتقدم وإكمال عملية الإنضمام",
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
                                    theText: "التوجة الان",
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
                              "عزيزي المستخدم هناك إشكالية,,الرجاء إعادة المحاولة مرة أخرى",
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
                                      theText: "الاخفاء",
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
