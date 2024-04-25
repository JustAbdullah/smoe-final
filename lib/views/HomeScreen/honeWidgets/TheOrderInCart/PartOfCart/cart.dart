import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../controllers/home_controller.dart';
import '../../../../../core/constant/app_text_styles.dart';
import '../../../../../core/constant/appcolors.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Obx(() {
      return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 280.h,
          child: homeController.isNotEmptyListOFProductsCart.value == true
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: homeController.dataProductsListCart.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    homeController
                                        .dataProductsListCart[index].name,
                                    style: TextStyle(
                                      color: AppColors.balckColorTypeFour,
                                      fontFamily: AppTextStyles.Almarai,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      homeController.deleteFromShoppingCart(
                                          homeController
                                              .dataProductsListCart[index]
                                              .list_order_product_id
                                              .toString());
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                            color: AppColors.redColor,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.w),
                                          child: Text(
                                            "222-حذف المنتج".tr,
                                            style: TextStyle(
                                              color: AppColors.whiteColor,
                                              fontFamily: AppTextStyles.Almarai,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                        )),
                                  )
                                ])),
                        SizedBox(
                          height: 7.h,
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
                                            .dataProductsListCart[index].total,
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                                  255, 57, 57, 57)
                                              .withOpacity(0.6),
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      Text(
                                        "17-ريال".tr,
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                                  255, 57, 57, 57)
                                              .withOpacity(0.6),
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        homeController
                                            .dataProductsListCart[index].quan,
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 64, 63, 63),
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        "223-قطعة".tr,
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 64, 63, 63),
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ])),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1.h,
                          color: AppColors.balckColorTypeFour.withOpacity(0.1),
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
                    "224-المعذرة...ولكن لايوجد أي محتويات في السلة".tr,
                    style: TextStyle(
                        color: AppColors.theAppColorYellow,
                        fontFamily: AppTextStyles.Almarai,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ));
    });
  }
}
