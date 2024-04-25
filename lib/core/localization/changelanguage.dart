import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../services/appservices.dart';

HomeController homeController = Get.put(HomeController());

class ChangeLanguageToLocale extends GetxController {
  Locale? language;

  bool themechage = false;

  RxInt changeLangData = 1.obs;
  RxBool isChange = false.obs;
  AppServices appServices = Get.find();
  /*ThemeData appTheme = themeAraib;*/

  changeLang(String langcode) {
    // ignore: unused_local_variable
    Locale locale = Locale(langcode);

    appServices.sharedPreferences.setString("lang", langcode);

    langcode == "ar" ? themechage = true : themechage = false;
    langcode == "ar" ? isChange.value = false : isChange.value = true;
    isChange.value = false;

/* Get.changeTheme(appTheme);*/
    if (langcode == "ar") {
      homeController.fetchMainTypeData();
      homeController
          .fetchProductsDataByType(homeController.TheType.value.toString());
      homeController.fetchOffersData();
      homeController.fetchProductsData();

      appServices.sharedPreferences.setInt("langData", 1);
      changeLangData.value =
          appServices.sharedPreferences.getInt('langData') as int;

      Get.changeTheme;

      isChange.value = true;
      update();
    } else if (langcode == "en") {
      homeController.fetchMainTypeData();
      homeController
          .fetchProductsDataByType(homeController.TheType.value.toString());
      homeController.fetchOffersData();
      homeController.fetchProductsData();
      appServices.sharedPreferences.setInt("langData", 2);
      changeLangData.value =
          appServices.sharedPreferences.getInt('langData') as int;
      Get.changeTheme;
      isChange.value = false;
      update();
    } else {
      update();
      Get.changeTheme;
      homeController.fetchMainTypeData();
      homeController
          .fetchProductsDataByType(homeController.TheType.value.toString());
      homeController.fetchOffersData();
      homeController.fetchProductsData();
    }
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    super.onInit();

    String? sharedPrefLang = appServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      homeController.fetchMainTypeData();
      homeController
          .fetchProductsDataByType(homeController.TheType.value.toString());
      homeController.fetchOffersData();
      homeController.fetchProductsData();
      language = Locale("ar");
      appServices.sharedPreferences.setInt("langData", 1);
      changeLangData.value =
          appServices.sharedPreferences.getInt('langData') as int;
      Get.changeTheme;
      isChange.value = true;
    } else if (sharedPrefLang == "en") {
      homeController.fetchMainTypeData();
      homeController
          .fetchProductsDataByType(homeController.TheType.value.toString());
      homeController.fetchOffersData();
      homeController.fetchProductsData();
      language = Locale("en");

      appServices.sharedPreferences.setInt("langData", 2);
      changeLangData.value =
          appServices.sharedPreferences.getInt('langData') as int;
      Get.changeTheme;
      isChange.value = false;
    } else {
      homeController.fetchMainTypeData();
      homeController
          .fetchProductsDataByType(homeController.TheType.value.toString());
      homeController.fetchOffersData();
      homeController.fetchProductsData();
      language = Locale(Get.deviceLocale!.languageCode);
      language == "ar" ? isChange.value = false : isChange.value = true;
    }
  }
}
