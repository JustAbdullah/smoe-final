//import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/class/class/crud.dart';

import '../core/data/model/extras.dart';
import '../core/data/model/maintype.dart';
import '../core/data/model/offers.dart';
import '../core/data/model/products.dart';
import '../core/services/appservices.dart';
import '../linksapi.dart';
import '../views/Auth/name_auth.dart';
import '../views/Auth/otp_number.dart';
import '../views/HomeScreen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController extends GetxController {
  ////////////////Branch/////

  final crud = Crud();

///////////////////Search Products,,,,,,,,,,////////////////////

//////////////////////////Show and hide operations Main and Sub Types,,,,,,////////////////

//////////////////////Get Data From DataBase..............................................//////////////////////////////

  //////..........................................////////////////

  goToHome() async {
    await Future.delayed(const Duration(seconds: 5), () async {
      Get.offAll(HomeScreen());
    });
  }

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

//////////////////////////////////////////////GetMainType.......................
  RxBool isNotEmptyMainType = false.obs;
  var dataList = <maintype>[].obs;

  Future<void> fetchMainTypeData() async {
    var response =
        await http.post(Uri.parse(AppLinksApi.TheMainTypes), body: {});

    if (response.statusCode == 200) {
      List data = json.decode(response.body)["data"];

      dataList.value = data.map((e) => maintype.fromJson(e)).toList();

      dataList.length == 0
          ? isNotEmptyMainType.value = false
          : isNotEmptyMainType.value = true;
    } else {
      isNotEmptyMainType.value = false;
      print("Error: ${response.statusCode}");
    }
  }

  ////////////////////Get Offers......................//////////

  RxBool isNotEmptyOffers = false.obs;
  var dataOffersList = <offers>[].obs;

  Future<void> fetchOffersData() async {
    var response =
        await http.post(Uri.parse(AppLinksApi.TheOffersData), body: {});

    if (response.statusCode == 200) {
      List data = json.decode(response.body)["data"];

      dataOffersList.value = data.map((e) => offers.fromJson(e)).toList();

      dataOffersList.length == 0
          ? isNotEmptyOffers.value = false
          : isNotEmptyOffers.value = true;
    } else {
      isNotEmptyOffers.value = false;
      print("Error: ${response.statusCode}");
    }
  } ////////////////////Get Products......................//////////

  RxBool isNotEmptyProducrs = false.obs;
  var dataProductsList = <Products>[].obs;

  Future<void> fetchProductsData() async {
    var response =
        await http.post(Uri.parse(AppLinksApi.TheProducts), body: {});

    if (response.statusCode == 200) {
      List data = json.decode(response.body)["data"];

      dataProductsList.value = data.map((e) => Products.fromJson(e)).toList();

      dataProductsList.length == 0
          ? isNotEmptyProducrs.value = false
          : isNotEmptyProducrs.value = true;
    } else {
      isNotEmptyProducrs.value = false;
      print("Error: ${response.statusCode}");
    }
  }

  /////////////////////#######################................Products Details................#######################//////////////////////////
  RxBool showTheDetailsProduct = false.obs;
  RxInt indexTheProductsList = 0.obs;
  goToDetailsProducts(var index) {
    indexTheProductsList.value = index;
    showTheDetailsProduct.value = true;
    theTotalPrice.value = int.tryParse(dataProductsList[index].price)!;
  }

  RxBool isNotEmptyExtras = false.obs;
  var dataExtrasList = <Extras>[].obs;
  Future<void> fetchGetextras(String idProducts) async {
    var response = await http.post(Uri.parse(AppLinksApi.Getextras),
        body: {"products_id": idProducts.toString()});

    if (response.statusCode == 200) {
      List data = json.decode(response.body)["data"];

      dataExtrasList.value = data.map((e) => Extras.fromJson(e)).toList();

      dataExtrasList.length == 0
          ? isNotEmptyExtras.value = false
          : isNotEmptyExtras.value = true;
    } else {
      isNotEmptyExtras.value = false;
      print("Error: ${response.statusCode}");
    }
  }

  //////////////////Add To Cart OR order.........................../////////
  Map<String, String> chosedTheExtras = {};
  RxInt indexTheExtrasList = 0.obs;

  RxInt theTotalPrice = 0.obs;

  RxInt TheNumberOfItme = 1.obs;

  AddTheItme() {
    TheNumberOfItme.value = TheNumberOfItme.value + 1;

    theTotalPrice.value = theTotalPrice.value +
        int.parse(
          dataProductsList[indexTheProductsList.value].price.toString(),
        );
  }

  MusnheItme() {
    if (TheNumberOfItme.value != 1) {
      TheNumberOfItme.value = TheNumberOfItme.value - 1;

      theTotalPrice.value = theTotalPrice.value -
          int.parse(
            dataProductsList[indexTheProductsList.value].price.toString(),
          );
    } else {}
  }

  AddExtras() {
    if (chosedTheExtras
        .containsKey("${dataExtrasList[indexTheExtrasList.value].id}")) {
      theTotalPrice.value = theTotalPrice.value -
          int.parse(dataExtrasList[indexTheExtrasList.value].price);

      chosedTheExtras.remove("${dataExtrasList[indexTheExtrasList.value].id}");
    } else {
      theTotalPrice.value = theTotalPrice.value +
          int.parse(dataExtrasList[indexTheExtrasList.value].price);

      chosedTheExtras[dataExtrasList[indexTheExtrasList.value].id.toString()] =
          dataExtrasList[indexTheExtrasList.value].idEx;

      /////////////
    }
  }

  BackToHome() {
    showTheDetailsProduct.value = false;

    chosedTheExtras.clear();
    TheNumberOfItme.value = 1;
    theTotalPrice.value = 0;
    MessageAddedIntoList.value = false;
  }

  //////////////////Auth With Number Phone

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
    isErrorAboutEnterOTP.value = false;
    isLoadingTheScreenSignUp.value = false;
    isAddTheUser.value = false;
    isEndOTP.value = false;
    isErrorAboutAddTheUser.value = false;
    nameController.clear();
    phoneController.clear();
    passwordController.clear();
    ErrorAboutNumber.value = false;
    isErrorAboutEnterOTP.value = false;
    waitCheckNumber.value = false;
    isErrorInOTP.value = false;
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
    cleanTheSignUp();
    Get.to(NameAuth());
  }

  String userID = "";
  String userName = "";
  String userPhone = "";

/////////DisplayData////////////////////
  RxString displayUserName = "ليس لديك حساب".obs;
  RxString displayUserId = "".obs;
  RxInt displayIsHavaAccount = 0.obs;
  RxString displayUserPhone = "".obs;

  RxDouble displayLongLocation = 0.0.obs;
  RxDouble displayLatLocation = 0.0.obs;

  RxBool waitCheckNumber = false.obs;
  RxBool ErrorAboutNumber = false.obs;
  RxBool isSendTheCode = false.obs;
  RxBool isErrorAboutEnterOTP = false.obs;
  RxBool isEndOTP = false.obs;
  FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isErrorInOTP = false.obs;

  RxString theNumber = "".obs;

  TextEditingController TheCodeTextController = TextEditingController();
  String theCodeString = "";

  RxString verificationIdSaved = "".obs;
  Timer? _timer;
  void verifyPhoneNumber(String phoneNumber) async {
    waitCheckNumber.value = true;
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // تم التحقق من رقم الهاتف تلقائياً
        await _auth.signInWithCredential(credential);
        waitCheckNumber.value = false;
        Get.to(CodeNumber());
        // قم بالتنقل إلى الشاشة التالية أو أي عملية تريدها
      },
      verificationFailed: (FirebaseAuthException e) {
        // فشل التحقق من رقم الهاتف
        // قم بإظهار رسالة خطأ أو أي عملية تريدها
        ErrorAboutNumber.value = true;
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationIdSaved.value = verificationId;
        isSendTheCode.value = true;
        waitCheckNumber.value = false;
        Get.to(CodeNumber());
        // تم إرسال رمز التحقق إلى رقم الهاتف
        // قم بإظهار حقل إدخال لرمز التحقق أو أي عملية تريدها
        // قم بحفظ قيمة verificationId لاستخدامها لاحقاً
        // إنشاء مؤقت ينتهي بعد 60 ثانية
        _timer = Timer(Duration(seconds: 60), () {
          waitCheckNumber.value;
          // إذا لم يتم إدخال رمز التحقق قبل انتهاء المؤقت
          // قم بإظهار رسالة خطأ للمستخدم
          // يمكنك استخدام أي طريقة تفضلها لإظهار الرسالة
          // مثلاً يمكنك استخدام Fluttertoast
          ErrorAboutNumber.value = true;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        waitCheckNumber.value;
        // انتهى وقت انتظار إدخال رمز التحقق
        isErrorAboutEnterOTP.value = true;
        // قم بإظهار رسالة تنبيه أو أي عملية تريدها
      },
    );
  }

  void signInWithPhoneNumber(String verificationId, String smsCode) async {
    waitCheckNumber.value = true;
    // إنشاء كائن PhoneAuthCredential باستخدام verificationId و smsCode
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    // تسجيل الدخول باستخدام كائن PhoneAuthCredential
    await _auth.signInWithCredential(credential);

    try {
      // تسجيل الدخول باستخدام الاعتماد

      isEndOTP.value = true;
      // التنقل إلى صفحة أخرى أو القيام بأي عمل آخر
    } on FirebaseAuthException catch (e) {
      isErrorInOTP.value = true;
      // التعامل مع أي استثناءات أخرى
      print(e);
    }
  }

  TextEditingController TheNameTextController = TextEditingController();
  String TheNameEnter = "";

  Future SignUp(String name, String phone) async {
    var response = await crud.postRequest(AppLinksApi.SignUp, {
      'user_name': name.toString(),
      'user_number_phone': phone.toString(),
    });
    if (response['status'] == "success") {
      getDataUser(phone);
      Get.to(HomeScreen());
    } else {}
    return response;
  }

  getDataUser(String phone) async {
    var response = await crud.postRequest(AppLinksApi.getUserData, {
      'user_number_phone': phone.toString(),
    });

    if (response['status'] == "success") {
      displayUserName.value = response['data'][0]['user_name'].toString();
      displayUserId.value = response['data'][0]['user_id'].toString();
      displayIsHavaAccount.value = 1;
      displayUserPhone.value =
          response['data'][0]['user_number_phone'].toString();
      displayLongLocation.value =
          double.tryParse(response['data'][0]['user_longitude'].toString())!;

      displayLatLocation.value =
          double.tryParse(response['data'][0]['user_latitude'].toString())!;

      appServices.sharedPreferences
          .setString('userName', displayUserName.value);
      appServices.sharedPreferences.setString('userID', displayUserId.value);
      appServices.sharedPreferences
          .setString('user_number_phone', displayUserPhone.value);
      appServices.sharedPreferences
          .setInt('isHaveAccount', displayIsHavaAccount.value);
      appServices.sharedPreferences
          .setDouble('user_longitude', displayLongLocation.value);
      appServices.sharedPreferences
          .setDouble('user_latitude', displayLatLocation.value);

      await Future.delayed(const Duration(seconds: 5), () async {
        onInit();
      });
    } else {}
    return response;
  }

  @override
  void onInit() {
    super.onInit();
    fetchMainTypeData();
    fetchOffersData();
    fetchProductsData();
    checkAboutUserAccount();
  }

  Future checkAboutUserAccount() async {
    if (appServices.sharedPreferences.containsKey('isHaveAccount')) {
      displayIsHavaAccount.value = 1;

      displayUserName.value =
          appServices.sharedPreferences.getString('userName') as String;
      displayUserId.value =
          appServices.sharedPreferences.getString('userID') as String;

      displayUserPhone.value = appServices.sharedPreferences
          .getString('user_number_phone') as String;
      displayLongLocation.value =
          appServices.sharedPreferences.getDouble('user_longitude') as double;

      displayLatLocation.value =
          appServices.sharedPreferences.getDouble('user_latitude') as double;

      getDataUser(displayUserPhone.value.toString());
    }
  }

  //////////////////////////////#############################################################/////////////////////////
  ///  //////////////////////////////#############################################################/////////////////////////
  //////////////////////////////#############################################################/////////////////////////
  //////////////////////////////#############################################################/////////////////////////
  //////////////////////////////#############################################################/////////////////////////
  //////////////////////////////#############################################################/////////////////////////
  //////////////////////////////#############################################################/////////////////////////
  //////////////////////////////#############################################################/////////////////////////
  //////////////////////////////#############################################################/////////////////////////

  //////////////////////////////...................The Orders.............................../////////////////////////
  var randomNumber = 0;

  RxBool MessageAddedIntoList = false.obs;
  addIntoOrder(String numberOrder, String total) async {
    var response = await crud.postRequest(AppLinksApi.addIntoOrder, {
      'user_id': displayUserId.value.toString(),
      'order_number': numberOrder.toString(),
      'total': total.toString(),
    });

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  addIntListProducts(String numberOrder, String total, String productId,
      String quantity) async {
    var response =
        await crud.postRequest(AppLinksApi.addIntoOrderListProducts, {
      'product_id': productId.toString(),
      'user_id': displayUserId.value.toString(),
      'total': total.toString(),
      'quan': quantity.toString(),
      'order': numberOrder.toString(),
    });

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  addIntListProductsEtr(
    String numberOrder,
    String productId,
    String extraId,
  ) async {
    var response =
        await crud.postRequest(AppLinksApi.addIntoOrderListProductsExt, {
      'product_id': productId.toString(),
      'user_id': displayUserId.value.toString(),
      'order_number': numberOrder.toString(),
      'extra_id': extraId.toString(),
    });

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  generateRandomOrderNumber() {
    if (appServices.sharedPreferences.containsKey('randomNumber')) {
      randomNumber =
          appServices.sharedPreferences.getInt('randomNumber') as int;
    } else {}

    if (randomNumber == 0) {
      Random random = new Random();

      randomNumber = random.nextInt(10000000);
      appServices.sharedPreferences.setInt('randomNumber', randomNumber);
    } else {}
  }

  CelarRandomNumber() {
    randomNumber = 0;
    appServices.sharedPreferences.setInt('randomNumber', 0);
  }
}
