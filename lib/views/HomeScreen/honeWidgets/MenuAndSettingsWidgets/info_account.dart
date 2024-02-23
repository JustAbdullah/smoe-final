import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smoe_app_final/controllers/home_controller.dart';

import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../customWidgets/custom_container.dart';
import '../../../../customWidgets/custom_text.dart';

class InfoAcount extends StatelessWidget {
  const InfoAcount({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.showTheAccountInfo.value,
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
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width,
                        height: 300.h,
                        child: SingleChildScrollView(
                            child: Column(children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                controller.showTheAccountInfo.value = false;
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColors.theAppColorYellow,
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
                          SizedBox(
                            height: 15.h,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "38-معلومات الحساب".tr,
                                style: TextStyle(
                                    height: 1.3.h,
                                    fontSize: 19,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              )),
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ContainerCustom(
                                    widthContainer: 150,
                                    heigthContainer: 40,
                                    theBorderRadius: 10,
                                    colorContainer: AppColors.theAppColorYellow,
                                    child: Center(
                                      child: TextCustom(
                                          theText: "39-اسم المستخدم:".tr,
                                          fontSizeWidth: 17,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontColor: AppColors.whiteColor),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextCustom(
                                      theText: controller.displayUserName.value,
                                      fontSizeWidth: 20,
                                      fontFamily: AppTextStyles.Almarai,
                                      fontColor: AppColors.blackColorTypeTeo),
                                ],
                              )),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ContainerCustom(
                                      widthContainer: 150,
                                      heigthContainer: 40,
                                      theBorderRadius: 10,
                                      colorContainer:
                                          AppColors.theAppColorYellow,
                                      child: Center(
                                        child: TextCustom(
                                            theText: "40-رقم الهاتف:".tr,
                                            fontSizeWidth: 17,
                                            fontFamily: AppTextStyles.Almarai,
                                            fontColor: AppColors.whiteColor),
                                      ))
                                ],
                              )),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextCustom(
                                      theText:
                                          controller.displayUserPhone.value,
                                      fontSizeWidth: 20,
                                      fontFamily: AppTextStyles.Almarai,
                                      fontColor: AppColors.blackColorTypeTeo),
                                ],
                              )),
                          SizedBox(
                            height: 5.h,
                          ),
                        ])))),
              ),

              /////////////////..............Loading to Take The Location........../////////////////
            ])));
  }
}
