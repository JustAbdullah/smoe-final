import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smoe_app_final/views/HomeScreen/honeWidgets/all_products_searching.dart';
import 'package:smoe_app_final/views/HomeScreen/honeWidgets/favorites.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../core/constant/images_path.dart';
import '../../customWidgets/custom_container.dart';
import '../../customWidgets/custom_container_api.dart';
import '../../customWidgets/custom_padding.dart';
import '../../customWidgets/custom_text.dart';
import '../../customWidgets/custome_textfiled.dart';
import '../../customWidgets/search_text_filed.dart';
import 'honeWidgets/TheOrder/order_list.dart';
import 'honeWidgets/TheOrderInCart/order.dart';
import 'honeWidgets/MenuAndSettingsWidgets/about_location.dart';
import 'honeWidgets/MenuAndSettingsWidgets/choose_language.dart';
import 'honeWidgets/MenuAndSettingsWidgets/get_location.dart';
import 'honeWidgets/MenuAndSettingsWidgets/info_account.dart';
import 'honeWidgets/MenuAndSettingsWidgets/settings_menu.dart';
import 'honeWidgets/MenuAndSettingsWidgets/show_location.dart';
import 'honeWidgets/ProductrsDetails/products_details.dart';
import 'honeWidgets/ProductrsDetails/show_message_add_into_cart.dart';
import 'honeWidgets/all_products.dart';
import 'honeWidgets/main_types.dart';
import 'honeWidgets/offers.dart';
import 'honeWidgets/top_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.whiteColorTypeOne,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: PaddingCustom(
                theBottom: 50,
                child: Column(children: [
                  SizedBox(
                    height: 00.h,
                  ),
                  PaddingCustom(
                      theTop: 00, theRight: 0, theLeft: 0, child: TopHeader()),
                  SizedBox(
                    height: 10.h,
                  ),
                  PaddingCustom(
                      theTop: 5,
                      theBottom: 0,
                      theLeft: 0,
                      theRight: 0,
                      child: Align(
                          alignment: Alignment.topRight, child: Offers())),
                  PaddingCustom(
                    theTop: 10,
                    theBottom: 0,
                    theLeft: 0,
                    theRight: 0,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: MainTypes(),
                    ),
                  ),
                  PaddingCustom(
                      theTop: 10,
                      theBottom: 0,
                      theLeft: 0,
                      theRight: 0,
                      child: Align(
                          alignment: Alignment.topRight, child: Favorites())),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23.w),
                      child: GetX<HomeController>(
                        builder: (controller) => TextFormFiledCustomSearch(
                          labelData: "ابحث عن اسم منتج ما",
                          hintData: "قم لطفًا بإدخال الاسم ",
                          iconData: controller.isSearching.value == true
                              ? Icons.close
                              : Icons.search,
                          controllerData: homeController.searchingControllr,
                          value: (value) {
                            SystemChrome.setEnabledSystemUIMode(
                                SystemUiMode.manual,
                                overlays: []);
                            controller.searching = value.toString();
                            return value;
                          },
                          fillColor: AppColors.theAppColorYellow,
                          hintColor: AppColors.balckColorTypeFour,
                          iconColor: controller.isSearching.value == true
                              ? AppColors.redColor
                              : AppColors.balckColorTypeThree,
                          borderSideColor: AppColors.theAppColorYellow,
                          fontColor: AppColors.balckColorTypeThree,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          autofillHints: [AutofillHints.name],
                          onChanged: (value) {
                            SystemChrome.setEnabledSystemUIMode(
                                SystemUiMode.manual,
                                overlays: []);

                            controller.searching = value.toString();
                            return value;
                          },
                          validator: (value) {},
                          onTap: () {
                            controller.makeSearchingReady(
                                controller.searching.toString());
                          },
                        ),
                      )),
                  PaddingCustom(
                      theTop: 10,
                      theBottom: 10,
                      theLeft: 0,
                      child: Align(
                          alignment: Alignment.topRight,
                          child: GetX<HomeController>(
                              builder: (Thecontroller) =>
                                  Thecontroller.isSearching.value == true
                                      ? AllProductdSearching()
                                      : AllProductd()))),
                ]),
              ),
            ),
            PaddingCustom(
              theBottom: 00,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 60.h,
                  color: AppColors.blackColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                alignment: Alignment.center,
                                color: AppColors.blackColor,
                                height: 55.h,
                                child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 5.h),
                                              child: Column(
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        "${ImagesPath.homeNew}",
                                                        width: 25.w,
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      TextCustom(
                                                          theText: "الرئيسية",
                                                          fontSizeWidth: 15,
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          fontColor: AppColors
                                                              .whiteColor),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ))),
                            SizedBox(
                              width: 15.w,
                            ),
                            Container(
                                alignment: Alignment.center,
                                color: AppColors.blackColor,
                                height: 55.h,
                                child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: InkWell(
                                      onTap: () {
                                        homeController.fetchProductsDataCart();
                                        homeController.showCart.value = true;
                                      },
                                      child: Row(
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 5.h),
                                              child: Column(
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        "${ImagesPath.cart}",
                                                        width: 25.w,
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      TextCustom(
                                                          theText: "السلة",
                                                          fontSizeWidth: 15,
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          fontColor: AppColors
                                                              .whiteColor),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ))),
                            SizedBox(
                              width: 15.w,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                  alignment: Alignment.center,
                                  color: AppColors.blackColor,
                                  height: 55.h,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: InkWell(
                                        onTap: () {
                                          homeController.viewOrderList();
                                        },
                                        child: Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.h),
                                                child: Column(
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          "${ImagesPath.bag}",
                                                          width: 25.w,
                                                        ),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                        TextCustom(
                                                            theText: "الطلبيات",
                                                            fontSizeWidth: 15,
                                                            fontFamily:
                                                                AppTextStyles
                                                                    .Almarai,
                                                            fontColor: AppColors
                                                                .whiteColor),
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ))),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Container(
                                alignment: Alignment.center,
                                color: AppColors.blackColor,
                                height: 55.h,
                                child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: InkWell(
                                      onTap: () {
                                        homeController.ShowThemenuApp.value =
                                            true;
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.h),
                                            child: Column(
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      "${ImagesPath.listNew}",
                                                      width: 25.w,
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    TextCustom(
                                                        theText: "الاعدادت",
                                                        fontSizeWidth: 15,
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai,
                                                        fontColor: AppColors
                                                            .whiteColor),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))),
                          ]),
                    ),
                  ),
                ),
              ),
            ),
            ProductsDetails(),
            SettingsMenu(),
            InfoAcount(),
            AboutLocation(),
            GetLocation(),
            ShowTheLocation(),
            ChooseLanguage(),
            AddIntoListCart(),
            Order(),
            TheOrderListUser(),
          ],
        ),
      ),
    );
  }
}
