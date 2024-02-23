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
    HomeController homeController = Get.put(HomeController());
    return InkWell(
        onTap: () {
          homeController.showTheBranch.value = true;
        },
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
                    theText: "سموي",
                    fontSizeWidth: 20,
                    fontFamily: AppTextStyles.Marhey,
                    fontColor: AppColors.TheMain,
                    fontWeight: FontWeight.bold,
                  )),
              Padding(
                  padding: EdgeInsets.only(right: 00.w, top: 10.h),
                  child: TextCustom(
                    theText: "الرئيسية",
                    fontSizeWidth: 23,
                    fontFamily: AppTextStyles.Almarai,
                    fontColor: AppColors.TheMain,
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
        ));
  }
}
