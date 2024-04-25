import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../../customWidgets/custom_text.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => InkWell(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 60.h,
              color: AppColors.theAppColorYellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 30.w, top: 10.h),
                      child: TextCustom(
                        theText: "16-سموي".tr,
                        fontSizeWidth: 20,
                        fontFamily: AppTextStyles.Marhey,
                        fontColor: AppColors.balckColorTypeFour,
                        fontWeight: FontWeight.bold,
                      )),
                  Padding(
                      padding: EdgeInsets.only(right: 00.w, top: 10.h),
                      child: TextCustom(
                        theText: controller.displayUserName.value,
                        fontSizeWidth: 23,
                        fontFamily: AppTextStyles.Almarai,
                        fontColor: AppColors.balckColorTypeFour,
                        fontWeight: FontWeight.bold,
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 10.w, top: 00.h),
                      child: Image.asset(
                        ImagesPath.LogoApp,
                        fit: BoxFit.cover,
                      )),
                ],
              ),
            )));
  }
}
