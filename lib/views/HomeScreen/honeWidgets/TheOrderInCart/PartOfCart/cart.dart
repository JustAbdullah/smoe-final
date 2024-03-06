import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smoe_app_final/views/HomeScreen/honeWidgets/TheOrderInCart/PartOfCart/ext.dart';

import '../../../../../controllers/home_controller.dart';
import '../../../../../core/constant/app_text_styles.dart';
import '../../../../../core/constant/appcolors.dart';
import '../../../../../core/constant/images_path.dart';
import '../../../../../customWidgets/custom_cachednetworkimage.dart';
import '../../../../../customWidgets/custom_container.dart';
import '../../../../../customWidgets/custom_container_api.dart';
import '../../../../../customWidgets/custom_padding.dart';
import '../../../../../customWidgets/custom_text.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Obx(() {
      return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 280.h,
          child: Expanded(
              child: homeController.isNotEmptyListOFProductsCart.value == true
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: homeController.dataProductsListCart.length,
                      itemBuilder: (context, index) {
                        homeController.fetchProductsExtDataCart(
                          homeController
                              .dataProductsListCart[index].list_order_product_id
                              .toString(),
                        );
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Text(
                                homeController.dataProductsListCart[index].name,
                                style: TextStyle(
                                  color: AppColors.balckColorTypeFour,
                                  fontFamily: AppTextStyles.Almarai,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            homeController
                                                .dataProductsListCart[index]
                                                .total,
                                            style: TextStyle(
                                              color: const Color.fromARGB(
                                                      255, 57, 57, 57)
                                                  .withOpacity(0.6),
                                              fontFamily: AppTextStyles.Almarai,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          Text(
                                            "ريال",
                                            style: TextStyle(
                                              color: const Color.fromARGB(
                                                      255, 57, 57, 57)
                                                  .withOpacity(0.6),
                                              fontFamily: AppTextStyles.Almarai,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            homeController
                                                .dataProductsListCart[index]
                                                .quan,
                                            style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 64, 63, 63),
                                              fontFamily: AppTextStyles.Almarai,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          Text(
                                            "قطعة",
                                            style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 64, 63, 63),
                                              fontFamily: AppTextStyles.Almarai,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]) //    ExtPage()
                                ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1.h,
                              color:
                                  AppColors.balckColorTypeFour.withOpacity(0.1),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        "المعذرة...ولكن لايوجد أي محتويات في السلة",
                        style: TextStyle(
                            color: AppColors.theAppColorYellow,
                            fontFamily: AppTextStyles.Almarai,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    )));
    });
  }
}
