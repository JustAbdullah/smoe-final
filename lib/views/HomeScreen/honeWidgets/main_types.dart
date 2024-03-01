import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../../customWidgets/custom_cachednetworkimage.dart';
import '../../../customWidgets/custom_container.dart';
import '../../../customWidgets/custom_container_api.dart';
import '../../../customWidgets/custom_padding.dart';
import '../../../customWidgets/custom_text.dart';

class MainTypes extends StatelessWidget {
  const MainTypes({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Obx(() {
      return homeController.isNotEmptyMainType.value
          ? SizedBox(
              height: 80.h,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homeController.dataList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: ContainerCustomApi(
                          colorContainer: AppColors.whiteColorTypeOne,
                          heigthContainer: 50.h,
                          child: CustomCachedNetworkImage(
                            urlTheImage:
                                homeController.dataList[index].img.toString(),
                            width: 60.w,
                            height: 50.h,
                            boxFit: BoxFit.contain,
                            circular: 5,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextCustom(
                        theText: homeController.dataList[index].name.toString(),
                        fontColor: AppColors.blackColorTypeTeo,
                        fontFamily: AppTextStyles.Almarai,
                        fontSizeWidth: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  );
                },
              ),
            )
          : ContainerCustom(
              heigthContainer: 120,
              widthContainer: 1300,
              colorContainer: AppColors.whiteColorTypeOne,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Shimmer.fromColors(
                        baseColor: Color.fromARGB(31, 83, 82, 82),
                        highlightColor: AppColors.whiteColor,
                        enabled: true,
                        child: PaddingCustom(
                            theRight: 1,
                            theLeft: 1,
                            child: Column(children: [
                              ContainerCustomApi(
                                colorContainer: AppColors.whiteColorTypeOne,
                                boxShape: BoxShape.circle,
                                heigthContainer: 70.h,
                                child: Image.asset(
                                  "${ImagesPath.LogoApp}",
                                  width: 80,
                                  height: 100,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                height: 19.h,
                              ),
                              Shimmer.fromColors(
                                  baseColor: Color.fromARGB(31, 83, 82, 82),
                                  highlightColor: AppColors.whiteColor,
                                  enabled: true,
                                  child: TextCustom(
                                    theText: "يتم التحميل",
                                    fontColor: AppColors.whiteColor,
                                    fontFamily: AppTextStyles.Marhey,
                                    fontSizeWidth: 15,
                                  )),
                            ])));
                  }));
    });
  }
}
