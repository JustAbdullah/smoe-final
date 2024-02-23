//import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/class/class/crud.dart';
import '../core/constant/images_path.dart';

import '../core/data/model/maintype.dart';
import '../core/services/appservices.dart';
import '../linksapi.dart';
import '../views/HomeScreen/home_screen.dart';

class HomeController extends GetxController {
  ////////////////Branch/////
  RxString nameBranch = "فرع أربيل".obs;
  RxInt idBranch = 3.obs;
  RxString categorie_name = "أطعمة".obs;
  RxInt categorie_id = 1.obs;
  RxBool noData = false.obs;
  RxBool noDataProduct = false.obs;

  RxBool showTheBranch = false.obs;

  final crud = Crud();

  final itemKey = GlobalKey();
  final controllerListViewOffers = ScrollController();

///////////////////Search Products,,,,,,,,,,////////////////////

//////////////////////////Show and hide operations Main and Sub Types,,,,,,////////////////

//////////////////////Get Data From DataBase..............................................//////////////////////////////

  getDataOffersFromDatabase() async {
    var response = await crud.postRequest(AppLinksApi.TheOffersData, {});

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  getDataMainTypesFromDatabase() async {
    var response = await crud.postRequest(AppLinksApi.TheMainTypes, {});

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  Future<List<maintype>>? maintypeItemsFuture;
  List<maintype> maintypeItems = [];
  List bodyMainType = [];

  checktypes() {
    maintypeItems.isEmpty
        ? {
            maintypeItemsFuture = getDataMainTypesFromDatabase(),
          }
        : nothing();
  }

  nothing() {}
  void setmaintypeItems(List<maintype> items) {
    maintypeItems = items;
  }

  Future<List<maintype>> getDataTheMainTypesFromDatabase() async {
    var response =
        await http.post(Uri.parse(AppLinksApi.TheMainTypes), body: {});
    final List body = json.decode(response.body)["data"];
    print("loooooode main type data ");
    return bodyMainType.map((e) => maintype.fromJson(e)).toList();
  }

  getDataProductsFromDatabase() async {
    var response = await crud.postRequest(AppLinksApi.TheProducts, {});

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  //////..........................................////////////////

  @override
  void onInit() {
    super.onInit();

    if (appServices.sharedPreferences.containsKey('isHaveAccount')) {
      displayIsHavaAccount.value =
          appServices.sharedPreferences.getInt('isHaveAccount') as int;

      displayUserName.value =
          appServices.sharedPreferences.getString('userName') as String;
      displayUserId.value =
          appServices.sharedPreferences.getString('userID') as String;

      displayUserPhone.value =
          appServices.sharedPreferences.getString('phone') as String;

      //   getDataUser(displayUserName.value.toString());
    }
  }

  goToHome() async {
    await Future.delayed(const Duration(seconds: 5), () async {
      Get.offAll(HomeScreen());
    });
  }

  //////////////////////////////////////The Auth/////////////////////
  AppServices appServices = Get.find();

////////SignUp/////////////////
  GlobalKey<FormState> formSignPhoneAndName = GlobalKey<FormState>();
  GlobalKey<FormState> formSignPassword = GlobalKey<FormState>();

  RxBool isLoadingTheScreenSignUp = false.obs;
  RxBool isAddTheUser = false.obs;
  RxBool isErrorAboutAddTheUser = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String nameSignUp = "";
  String passwordSignUp = "";
  String phoneSignUp = "";

  waitScreenAuthSignUp() async {
    var formKeyData = formSignPhoneAndName.currentState;
    if (formKeyData!.validate()) {
      isLoadingTheScreenSignUp.value = true;
      Future.delayed(const Duration(seconds: 4), () async {
        isLoadingTheScreenSignUp.value = false;
        isAddTheUser.value = true;
      });
    }
  }

  cleanWaitScreenAuthSignUp() {
    isLoadingTheScreenSignUp.value = false;
    isAddTheUser.value = false;
  }

  /* signUpAccounts(
    String nameUSerNew,
    String password,
    String phone,
  ) async {
    var formKeyData = formSignPassword.currentState;
    if (formKeyData!.validate()) {
      isLoadingTheScreenSignUp.value = true;
      Future.delayed(const Duration(seconds: 3), () async {
        var response = await crud.postRequest(AppLinksApi.signUp, {
          'user_name': nameUSerNew.toString(),
          'user_password': password.toString(),
          'phone': phone.toString(),
        });
///////
        if (response['status'] == "success") {
          getDataUser(nameUSerNew.toString());
          isLoadingTheScreenSignUp.value = false;
          isAddTheUser.value = true;
        } else {
          isLoadingTheScreenSignUp.value = false;
          isErrorAboutAddTheUser.value = true;
        }

        return response;
      });
    }
  }*/

  cleanTheSignUp() {
    isLoadingTheScreenSignUp.value = false;
    isAddTheUser.value = false;
    isErrorAboutAddTheUser.value = false;
    nameController.clear();
    phoneController.clear();
    passwordController.clear();
    nameSignUp = "";
    passwordSignUp = "";
    phoneSignUp = "";
  }

  ////////////Login//////////////
  GlobalKey<FormState> formLogin = GlobalKey<FormState>();
  String nameLogin = "";
  String passwordLogin = "";
  TextEditingController nameControllerLogin = TextEditingController();
  TextEditingController passwordControllerLogin = TextEditingController();
  RxBool isLoadingTheScreenLogin = false.obs;
  RxBool isTheUserEnterTheRealyDataLogin = false.obs;
  RxBool isErrorAboutLoginTheUser = false.obs;

/*  loginAccounts(String nameUSerNew, String password) async {
    var formKeyData = formLogin.currentState;
    if (formKeyData!.validate()) {
      isLoadingTheScreenLogin.value = true;
      Future.delayed(const Duration(seconds: 3), () async {
        var response = await crud.postRequest(AppLinksApi.Login, {
          'user_name': nameUSerNew.toString(),
          'user_password': password.toString(),
        });
///////
        if (response['status'] == "success") {
          getDataUser(nameUSerNew.toString());

          isLoadingTheScreenLogin.value = false;
          isTheUserEnterTheRealyDataLogin.value = true;
        } else {
          isErrorAboutLoginTheUser.value = true;
        }

        return response;
      });
    }
  }
*/
  cleanTheLogin() {
    nameLogin = "";
    passwordLogin = "";
    nameControllerLogin.clear();
    passwordControllerLogin.clear();
    isLoadingTheScreenLogin.value = false;
    isTheUserEnterTheRealyDataLogin.value = false;
    isErrorAboutLoginTheUser.value = false;
  }

///////////Get Data User////////////////

  goToHomeLoginSignUp() {
    Get.to(HomeScreen());
  }

  String userID = "";
  String userName = "";
  String userPhone = "";

/*  getDataUser(String name) async {
    var response = await crud.postRequest(AppLinksApi.getDataUser, {
      'user_name': name.toString(),
    });

    if (response['status'] == "success") {
      userID = response['data'][0]['user_id'].toString();
      userName = response['data'][0]['user_name'].toString();
      userPhone = response['data'][0]['phone'].toString();
      appServices.sharedPreferences.setInt('isHaveAccount', 1);
      appServices.sharedPreferences.setString('userName', userName);
      appServices.sharedPreferences.setString('userID', userID);
      appServices.sharedPreferences.setString('phone', userPhone);

      await Future.delayed(const Duration(seconds: 5), () async {
        onInit();
      });
    } else {}
    return response;
  }*/

/////////DisplayData////////////////////
  RxString displayUserName = "ليس لديك حساب".obs;
  RxString displayUserId = "".obs;
  RxInt displayIsHavaAccount = 0.obs;
  RxString displayUserPhone = "".obs;
  RxString displayUserEligibilityAdd = "".obs;
  RxBool isUserNotHaveAccount = false.obs;

  RxDouble displayLongLocation = 0.0.obs;
  RxDouble displayLatLocation = 0.0.obs;
//...........Settings Accounts......///////////////////

  RxBool ShowThemenuApp = false.obs;
  RxBool isEnableLocationService = false.obs;
  RxBool MessageAboutLocationServiceEnable = false.obs;
  RxBool showTheAccountInfo = false.obs;
  RxBool IsEnterPhoneNumber = false.obs;
  RxBool isVerificationLocationCompleted = false.obs;

  RxBool showLang = false.obs;
  RxBool messageAboutNotHaveAccount = false.obs;

//////////////////............................Get The Location..............///////////////////////
  RxBool aboutLocation = false.obs;
  RxBool locationPage = false.obs;
  RxBool showTheLocation = false.obs;
  RxBool checkTheLocation = false.obs;
  var myCurrentPositionLatitude = 2.2;
  var myCurrentPositionLongitude = 2.2;
  RxBool IsrequestPermissionDenied = false.obs;
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  RxString address = "لايوجد عنوان".obs;
  Future getPo() async {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    if (services == true) {
      per = await Geolocator.checkPermission();
      if (per == LocationPermission.denied) {
        per = await Geolocator.requestPermission();
      } else {
        await Geolocator.getCurrentPosition().then((value) {
          myCurrentPositionLatitude = value.latitude;
          myCurrentPositionLongitude = value.longitude;
        });
      }
    }
  }

  Future checkIsEnableLocationServices() async {
    checkTheLocation.value = true;
    bool services;
    LocationPermission per;
    await Future.delayed(Duration(seconds: 3), () async {
      services = await Geolocator.isLocationServiceEnabled();
      if (services == true) {
        per = await Geolocator.checkPermission();
        if (per == LocationPermission.denied) {
          IsrequestPermissionDenied.value = true;
          per = await Geolocator.requestPermission();
        } else {
          await Geolocator.getCurrentPosition().then((value) {
            myCurrentPositionLatitude = value.latitude;
            myCurrentPositionLongitude = value.longitude;
            displayLongLocation.value = value.longitude;
            displayLatLocation.value = value.latitude;

            // savelocationUser(myCurrentPositionLatitude.toString(),
            //   myCurrentPositionLongitude.toString());
          });

          isVerificationLocationCompleted.value = true;
        }
      } else {
        MessageAboutLocationServiceEnable.value = true;
      }
    });
  }

  Future askPermissionOfLocation() async {
    // ignore: unused_local_variable
    LocationPermission per;
    per = await Geolocator.requestPermission();
    checkIsEnableLocationServices();
  }

  void ConvertIntoTextAddress() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        displayLatLocation.value, displayLongLocation.value);
    Placemark placeMark = placemarks[0];

    address.value = placeMark.toString();
  }

  RxBool isLoading = false.obs;
  RxBool isNotEmpty = false.obs;
  var dataList = <maintype>[].obs;

  Future<void> fetchData() async {
    var response =
        await http.post(Uri.parse(AppLinksApi.TheMainTypes), body: {});

    if (response.statusCode == 200) {
      List data = json.decode(response.body)["data"];

      dataList.value = data.map((e) => maintype.fromJson(e)).toList();

      dataList.length == 0 ? isNotEmpty.value = false : isNotEmpty.value = true;
    } else {
      print("Error: ${response.statusCode}");
    }
  }
}
