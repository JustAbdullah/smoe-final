import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../../customWidgets/custom_cachednetworkimage.dart';
import '../../../customWidgets/custom_container.dart';
import '../../../customWidgets/custom_container_api.dart';
import '../../../customWidgets/custom_padding.dart';
import '../../../customWidgets/custom_text.dart';
import 'package:shimmer/shimmer.dart';

/*class ListOfBranchApi extends StatelessWidget {
  const ListOfBranchApi({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return FutureBuilder(
        future: homeController.getBranchFromDatabase(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.of(context).size.height,
              color: AppColors.whiteColorTypeTwo,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data['data'].length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return PaddingCustom(
                        theBottom: 14,
                        theLeft: 13,
                        theRight: 13,
                        theTop: 14,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: InkWell(
                              onTap: () {
                                homeController.idBranch.value = int.parse(
                                    snapshot.data['data'][i]['Branch_id']);
                                homeController.nameBranch.value =
                                    snapshot.data['data'][i]['Branch_name'];

                                homeController.showTheBranch.value = false;
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.h, horizontal: 1.w),
                                  child: Text(
                                    snapshot.data['data'][i]['Branch_name'],
                                    style: TextStyle(
                                      height: 1,
                                      color: AppColors.blackColor,
                                      fontFamily: AppTextStyles.Almarai,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )));
                  }),
            );
          } else {
            return Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.of(context).size.height,
                color: AppColors.whiteColorTypeTwo,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 15,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Shimmer.fromColors(
                          baseColor: Color.fromARGB(31, 83, 82, 82),
                          highlightColor: AppColors.whiteColor,
                          enabled: true,
                          child: PaddingCustom(
                            theTop: 10,
                            theBottom: 10,
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: 200.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ))),
                          ));
                    }));
          }
        });
  }
}
*/