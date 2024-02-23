import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
import '../Auth/sign_up_screen.dart';
import '../types_api/list_of_types_works_api.dart';
import 'honeWidgets/MenuAndSettingsWidgets/about_location.dart';
import 'honeWidgets/MenuAndSettingsWidgets/choose_language.dart';
import 'honeWidgets/MenuAndSettingsWidgets/get_location.dart';
import 'honeWidgets/MenuAndSettingsWidgets/info_account.dart';
import 'honeWidgets/MenuAndSettingsWidgets/settings_menu.dart';
import 'honeWidgets/MenuAndSettingsWidgets/show_location.dart';
import 'honeWidgets/highest_rating.dart';
import 'honeWidgets/main_types.dart';
import 'honeWidgets/offers.dart';
import 'honeWidgets/offers_list.dart';
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
                      theTop: 0,
                      theBottom: 0,
                      theLeft: 0,
                      theRight: 0,
                      child: Align(
                          alignment: Alignment.topRight, child: Favorites())),
                  PaddingCustom(
                      theTop: 20,
                      theBottom: 0,
                      theLeft: 5,
                      theRight: 5,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: TextCustom(
                            theText: "البحث وجميع المنتجات",
                            fontSizeWidth: 23,
                            fontFamily: AppTextStyles.Cairo,
                            fontColor: AppColors.TheMain),
                      )),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17.w),
                    child: TextFormFiledCustom(
                      labelData: "ابحث عن اسم منتج ما",
                      hintData: "قم لطفًا بإدخال الاسم ",
                      iconData: Icons.search,
                      controllerData: homeController.nameControllerLogin,
                      value: (value) {
                        return value;
                      },
                      fillColor: AppColors.whiteColor,
                      hintColor: AppColors.TheMain,
                      iconColor: AppColors.TheMain,
                      borderSideColor: AppColors.whiteColor,
                      fontColor: AppColors.balckColorTypeThree,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      autofillHints: [AutofillHints.name],
                      onChanged: (value) {
                        return value;
                      },
                      validator: (value) {},
                    ),
                  ),
                  PaddingCustom(
                      theTop: 10,
                      theBottom: 30,
                      theLeft: 0,
                      child: Align(
                          alignment: Alignment.topRight,
                          child: HighestRating())),
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
                  color: AppColors.theAppColorYellow,
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
                                color: AppColors.theAppColorYellow,
                                height: 55.h,
                                child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(SignUp());
                                      },
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
                                                              .TheMain),
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
                                color: AppColors.theAppColorYellow,
                                height: 55.h,
                                child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(SignUp());
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
                                                              .TheMain),
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
                              onTap: () {
                                Get.to(SignUp());
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  color: AppColors.theAppColorYellow,
                                  height: 55.h,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: InkWell(
                                        onTap: () {},
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
                                                                .TheMain),
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
                                color: AppColors.theAppColorYellow,
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
                                                        fontColor:
                                                            AppColors.TheMain),
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
            /*    GetX<HomeController>(
                builder: (controller) => Visibility(
                    visible: controller.showTheBranch.value,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.black38,
                    ))),
            GetX<HomeController>(
                builder: (controller) => Visibility(
                    visible: controller.showTheBranch.value,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.black38,
                    ))),
            GetX<HomeController>(
                builder: (controller) => Visibility(
                    visible: controller.showTheBranch.value,
                    child: ListOfBranchApi())),*/
            SettingsMenu(),
            InfoAcount(),
            AboutLocation(),
            GetLocation(),
            ShowTheLocation(),
            ChooseLanguage(),
          ],
        ),
      ),
    );
  }
}
