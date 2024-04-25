
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../../../controllers/home_controller.dart';
import '../../../../../core/constant/app_text_styles.dart';


class CartOrder extends StatelessWidget {
  const CartOrder({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Obx(() {
      return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "217-رقم الطلبية:".tr,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 57, 57, 57)
                                .withOpacity(0.6),
                            fontFamily: AppTextStyles.Almarai,
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              homeController
                                  .dataOrderList[
                                      homeController.indexTheOrder.value]
                                  .order_number,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 57, 57, 57)
                                    .withOpacity(0.6),
                                fontFamily: AppTextStyles.Almarai,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ]) //
                  ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "218-إجمالي سعر الطلبية:".tr,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 57, 57, 57)
                                .withOpacity(0.6),
                            fontFamily: AppTextStyles.Almarai,
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              homeController
                                  .dataOrderList[
                                      homeController.indexTheOrder.value]
                                  .total,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 57, 57, 57)
                                    .withOpacity(0.6),
                                fontFamily: AppTextStyles.Almarai,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "17-ريال",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 57, 57, 57)
                                    .withOpacity(0.6),
                                fontFamily: AppTextStyles.Almarai,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ]) //
                  ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "207-تاريخ ووقت الطلب:",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 57, 57, 57)
                                .withOpacity(0.6),
                            fontFamily: AppTextStyles.Almarai,
                            fontSize: 14,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              homeController
                                  .dataOrderList[
                                      homeController.indexTheOrder.value]
                                  .date_order_user,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 57, 57, 57)
                                    .withOpacity(0.6),
                                fontFamily: AppTextStyles.Almarai,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 3.w,
                            ),
                            Text(
                              homeController
                                  .dataOrderList[
                                      homeController.indexTheOrder.value]
                                  .time_order_user,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 57, 57, 57)
                                    .withOpacity(0.6),
                                fontFamily: AppTextStyles.Almarai,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ]) //
                  ),
            ],
          ));
    });
  }
}
