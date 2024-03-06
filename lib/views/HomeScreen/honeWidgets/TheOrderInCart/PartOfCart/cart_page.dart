import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smoe_app_final/controllers/home_controller.dart';
import 'package:smoe_app_final/views/HomeScreen/honeWidgets/TheOrderInCart/PartOfCart/cart.dart';

import '../../../../../core/constant/app_text_styles.dart';
import '../../../../../core/constant/appcolors.dart';
import '../../../../../customWidgets/custom_padding.dart';
import '../../../../../customWidgets/custom_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.showThePartOFCart.value,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 0.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.w),
                        child: Container(
                          alignment: Alignment.center,
                          height: 35.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: AppColors.yellowColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "محتويات السلة",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.balckColorTypeFour),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CartItems(),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1.h,
                        color: const Color.fromARGB(255, 39, 38, 38)
                            .withOpacity(0.7),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "سعر الخصم:",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 57, 57, 57),
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "0",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 57, 57, 57),
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      "ريال",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 57, 57, 57),
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ])),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "إجمالي السعر:",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 57, 57, 57),
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    GetX<HomeController>(
                                        builder: (controller) => Text(
                                              controller.totalPrice.value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 57, 57, 57),
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      "ريال",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 57, 57, 57),
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ]) //    ExtPage()
                          ),

                      //    ExtPage()
                    ],
                  ),
                ),
              ],
            )));
  }
}
