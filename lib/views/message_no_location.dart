import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smoe_app_final/controllers/home_controller.dart';

import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';
import '../../../../customWidgets/custom_padding.dart';

class NotHaveLocation extends StatelessWidget {
  const NotHaveLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.isNoLocation.value,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black45,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black45,
                ),
                PaddingCustom(
                  theBottom: 000,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: 170.h,
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Lottie.asset(ImagesPath.error, width: 80.w),
                            SizedBox(
                              height: 14.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              child: Text(
                                "211-عزيزي العميل لم تقم بإضافة عنوانك بعد".tr,
                                style: TextStyle(
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour,
                                  fontSize: 15.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.isNoLocation.value = false;
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 110.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                        color: AppColors.theAppColorYellow,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                      "166-الاخفاء".tr,
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeFour,
                                        fontSize: 15.sp,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
