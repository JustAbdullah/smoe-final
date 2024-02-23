import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return FutureBuilder(
        future: homeController.getDataProductsFromDatabase(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
                width: MediaQuery.sizeOf(context).width,
                color: AppColors.whiteColorTypeOne,
                height: 130.h,
                child: homeController.noData.value == true
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(ImagesPath.noData, width: 200.w),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextCustom(
                                theText:
                                    "لايوجد منتجات في هذا الفرع لهذا التصنيف",
                                fontSizeWidth: 15,
                                fontFamily: AppTextStyles.Almarai,
                                fontWeight: FontWeight.bold,
                                fontColor: AppColors.TheMain),
                          ],
                        ),
                      )
                    : ContainerCustom(
                        heigthContainer: 130,
                        widthContainer: MediaQuery.of(context).size.width,
                        colorContainer: AppColors.whiteColorTypeOne,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data['data'].length,
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              return PaddingCustom(
                                theRight: 5,
                                theLeft: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.whiteColor,
                                  ),
                                  height: 130.h,
                                  width: 100.w,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: CustomCachedNetworkImage(
                                            urlTheImage: snapshot.data['data']
                                                    [i]['products_image']
                                                .toString(),
                                            width: 100,
                                            height: 80,
                                            boxFit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w),
                                          child: Text(
                                            snapshot.data['data'][i]
                                                ['prooduct_name_ar'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColors.balckColorTypeThree,
                                              fontFamily: AppTextStyles.Almarai,
                                              fontSize: 14.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextCustom(
                                              theText: snapshot.data['data'][i]
                                                  ['products_price'],
                                              fontColor:
                                                  AppColors.balckColorTypeThree,
                                              fontFamily: AppTextStyles.Almarai,
                                              fontSizeWidth: 12,
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            TextCustom(
                                              theText: "ريال",
                                              fontColor:
                                                  AppColors.balckColorTypeThree,
                                              fontFamily: AppTextStyles.Almarai,
                                              fontSizeWidth: 12,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ));
          } else {
            return ContainerCustom(
                heigthContainer: 120,
                widthContainer: MediaQuery.of(context).size.width,
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
          }
        });
  }
}
