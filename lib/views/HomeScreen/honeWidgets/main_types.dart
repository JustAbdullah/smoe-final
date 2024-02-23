import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../../core/data/model/maintype.dart';
import '../../../customWidgets/custom_cachednetworkimage.dart';
import '../../../customWidgets/custom_container.dart';
import '../../../customWidgets/custom_container.dart';
import '../../../customWidgets/custom_container_api.dart';
import '../../../customWidgets/custom_padding.dart';
import '../../../customWidgets/custom_text.dart';

class MainTypes extends StatelessWidget {
  const MainTypes({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    homeController.fetchData();
    return Obx(() {
      // قم بإنشاء ListViewBuilder داخل Obx
      // لتحديث القائمة تلقائيا عند تغيير الحالة
      return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 100.h,
          child: homeController.isNotEmpty.value
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeController.dataList.length,
                  itemBuilder: (context, index) {
                    var data = homeController.dataList[index];

                    return Container(
                      height: 100,
                      color: AppColors.whiteColorTypeOne,
                      child: PaddingCustom(
                        theRight: 0,
                        theLeft: 0,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: ContainerCustomApi(
                                colorContainer: AppColors.whiteColorTypeOne,
                                heigthContainer: 40.h,
                                child: CustomCachedNetworkImage(
                                  urlTheImage: data.img.toString(),
                                  width: 60.w,
                                  height: 40.h,
                                  boxFit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextCustom(
                              theText: data.name.toString(),
                              fontColor: AppColors.blackColorTypeTeo,
                              fontFamily: AppTextStyles.Almarai,
                              fontSizeWidth: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text("فارغ"),
                ));
    });
  }
}
