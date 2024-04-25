import 'dart:async';

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

class Offers extends StatefulWidget {
  const Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;
  void _startAutoScroll() {
    const autoScrollDuration = Duration(seconds: 5);
    Timer.periodic(autoScrollDuration, (timer) {
      // التحقق من الحالة قبل التمرير
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      final scrollAmount = 205.w; // حسب حجم العنصر الخاص بك

      if (currentScroll + scrollAmount >= maxScroll) {
        _scrollController.animateTo(
          0.0,
          duration: Duration(seconds: 1),
          curve: Curves.easeOut,
        );
      } else {
        _scrollController.animateTo(
          currentScroll + scrollAmount,
          duration: Duration(seconds: 1),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Obx(() {
      return Container(
          width: MediaQuery.sizeOf(context).width,
          color: const Color.fromRGBO(250, 248, 248, 1),
          child: homeController.isNotEmptyOffers.value
              ? ContainerCustom(
                  heigthContainer: 140,
                  widthContainer: MediaQuery.of(context).size.width,
                  colorContainer: AppColors.whiteColorTypeOne,
                  child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: homeController.dataOffersList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return PaddingCustom(
                          theRight: 5,
                          theLeft: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.whiteColor,
                            ),
                            height: 140.h,
                            width: 205.w,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      homeController.goToDetailsOfers(index);
                                    },
                                    child: CustomCachedNetworkImage(
                                      urlTheImage: homeController
                                          .dataOffersList[index].img
                                          .toString(),
                                      width: 205.w,
                                      height: 100,
                                      boxFit: BoxFit.cover,
                                      circular: 10,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    child: Text(
                                      homeController.dataOffersList[index].name
                                          .toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.balckColorTypeThree,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextCustom(
                                        theText: homeController
                                            .dataOffersList[index].price
                                            .toString(),
                                        fontColor:
                                            AppColors.balckColorTypeThree,
                                        fontFamily: AppTextStyles.Almarai,
                                        fontSizeWidth: 12,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      TextCustom(
                                        theText: "17-ريال".tr,
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
                                        theText: "18-يتم التحميل".tr,
                                        fontColor: AppColors.whiteColor,
                                        fontFamily: AppTextStyles.Marhey,
                                        fontSizeWidth: 15,
                                      )),
                                ])));
                      })));
    });
  }
}
