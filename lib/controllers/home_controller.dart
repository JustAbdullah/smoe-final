//import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:smoe_app_final/views/onBoarding/onboarding.dart';

import '../core/class/class/crud.dart';

import '../core/data/model/extras.dart';
import '../core/data/model/list_of_order.dart';
import '../core/data/model/list_products_cart.dart';
import '../core/data/model/list_products_extras_cart.dart';
import '../core/data/model/maintype.dart';
import '../core/data/model/offers.dart';
import '../core/data/model/orders_offers.dart';
import '../core/data/model/products.dart';
import '../core/services/appservices.dart';
import '../linksapi.dart';
import '../views/Auth/login/otp_number_login.dart';
import '../views/Auth/sign_up/name_auth.dart';
import '../views/Auth/sign_up/otp_number.dart';
import '../views/HomeScreen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../views/HomeScreen/home_status.dart';
import '../views/WelcomeScreen/welcome_screen.dart';

class HomeController extends GetxController {
  ////////////////Branch/////

  final crud = Crud();

///////////////////Search Products,,,,,,,,,,////////////////////

//////////////////////////Show and hide operations Main and Sub Types,,,,,,////////////////

//////////////////////Get Data From DataBase..............................................//////////////////////////////

  //////..........................................////////////////

  RxBool theWay = false.obs;
  WhereGoingTheApp() {
    Future.delayed(Duration(seconds: 5), () async {
      if (theWay.value == false) {
        if (appServices.sharedPreferences.containsKey('onBoarding')) {
          if (appServices.sharedPreferences.containsKey('isHaveAccount')) {
            Get.to(HomeStatus());
            theWay.value = true;
          } else {
            Get.to(WelcomeScreen());
            theWay.value = true;
          }
        } else {
          Get.to(OnBoarding());
          theWay.value = true;
        }
      }
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

  RxBool isNotEmptyProducrsByType = false.obs;
  var dataProductsListByType = <Products>[].obs;

  RxInt TheType = 1.obs;
  Future<void> fetchProductsDataByType(String id) async {
    var response = await http.post(Uri.parse(AppLinksApi.getProductsByType),
        body: {"prooduct_type": id.toString()});

    if (response.statusCode == 200) {
      List data = json.decode(response.body)["data"];

      dataProductsListByType.value =
          data.map((e) => Products.fromJson(e)).toList();

      dataProductsListByType.length == 0
          ? isNotEmptyProducrsByType.value = false
          : isNotEmptyProducrsByType.value = true;
    } else {
      isNotEmptyProducrsByType.value = false;
      print("Error: ${response.statusCode}");
    }
  }

  /////////////////////////////#######################..................... Products Details Type .................../////////////
  RxBool showTheDetailsProductType = false.obs;
  RxInt indexTheProductsListType = 0.obs;
  goToDetailsProductsType(var index) {
    indexTheProductsListType.value = index;
    showTheDetailsProductType.value = true;
    PriceProducts.value = int.tryParse(dataProductsListByType[index].price)!;
    theTotalPrice.value = int.tryParse(dataProductsListByType[index].price)!;
  }

  /////////////////////#######################................Products Details................#######################//////////////////////////
  RxBool showTheDetailsProduct = false.obs;
  RxInt indexTheProductsList = 0.obs;
  goToDetailsProducts(var index) {
    indexTheProductsList.value = index;
    showTheDetailsProduct.value = true;
    PriceProducts.value = int.tryParse(dataProductsListByType[index].price)!;
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
  RxInt PriceProducts = 0.obs;
  RxInt theTotalPrice = 0.obs;
  RxInt totalExt = 0.obs;

  RxInt TheNumberOfItme = 1.obs;

  AddTheItme() {
    TheNumberOfItme.value = TheNumberOfItme.value + 1;

    /* theTotalPrice.value = theTotalPrice.value +
        int.parse(
          dataProductsList[indexTheProductsList.value].price.toString(),
        );*/
    theTotalPrice.value = PriceProducts.value * TheNumberOfItme.value;
  }

  MusnheItme() {
    if (TheNumberOfItme.value != 1) {
      TheNumberOfItme.value = TheNumberOfItme.value - 1;

      theTotalPrice.value = PriceProducts.value * TheNumberOfItme.value;
    } else {}
  }

  Itme() {
    theTotalPrice.value = PriceProducts.value * TheNumberOfItme.value;
  }

  /* AddExtras() {
    if (chosedTheExtras
        .containsKey("${dataExtrasList[indexTheExtrasList.value].id}")) {
      PriceProducts.value = PriceProducts.value -
          int.parse(dataExtrasList[indexTheExtrasList.value].price);

      Itme();

      chosedTheExtras.remove("${dataExtrasList[indexTheExtrasList.value].id}");
    } else {
      PriceProducts.value = PriceProducts.value +
          int.parse(dataExtrasList[indexTheExtrasList.value].price);
      Itme();

      /////////////
    }
  }*/

  BackToHome() {
    showTheDetailsProduct.value = false;
    showTheDetailsProductSearching.value = false;
    showTheDetailsProductType.value = false;
    chosedTheExtras.clear();
    messagenoCart.value = false;
    TheNumberOfItme.value = 1;
    theTotalPrice.value = 0;
    PriceProducts.value = 0;
    theTotalPrice.value = 0;
    totalExt.value = 0;
    showOffersDetials.value = false;

    MessageAddedIntoList.value = false;
    PriceOffers.value = 0;
    theTotalPriceOffers.value = 0;

    messagesAboutOfersInOrder.value = false;
    indexTheOfferssList.value = 0;
    messageCreateOrder.value = false;
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

  goToHomeLogin(String phone) {
    getDataUser(phone);
    cleanTheSignUp();

    Get.to(HomeScreen());
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

  Future Login(String phone) async {
    var response = await crud.postRequest(AppLinksApi.login, {
      'user_number_phone': phone.toString(),
    });
    if (response['status'] == "success") {
      verifyPhoneNumberLogin(phone.toString());
    } else {
      ErrorAboutNumber.value = true;
    }
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
          .setDouble('Long', displayLongLocation.value);
      appServices.sharedPreferences.setDouble('Lat', displayLatLocation.value);

      onInit();
    } else {}
    return response;
  }

  void verifyPhoneNumberLogin(String phoneNumber) async {
    waitCheckNumber.value = true;
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // تم التحقق من رقم الهاتف تلقائياً
        await _auth.signInWithCredential(credential);
        waitCheckNumber.value = false;
        Get.to(CodeNumberTheLogin());
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
        Get.to(CodeNumberTheLogin());
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

  //////////////////////////////#############################################################/////////////////////////
  ///  //////////////////////////////#############################################################/////////////////////////
  //////////////////////////////#############################################################/////////////////////////
  //////////////////////////////#############################################################/////////////////////////
  //////////////////////////////##################################INIT ON###########################/////////////////////////
  //////////////////////////////#############################################################/////////////////////////
  //////////////////////////////#############################################################/////////////////////////
  //////////////////////////////#############################################################/////////////////////////
  //////////////////////////////#############################################################/////////////////////////

//////////////////////////////////////.............Init On................................////////////////////

  RxBool isGetData = false.obs;
  @override
  void onInit() {
    super.onInit();
    checkConnectivity();
    //startAutoScroll();

    if (isGetData.value == false) {
      fetchMainTypeData();
      fetchProductsDataByType(TheType.value.toString());
      fetchOffersData();
      fetchProductsData();
      checkAboutUserAccount();
      GetgenerateRandomOrderNumberFromMemory();
      fetchOrder();
      fetchOffersOrders();
      Future.delayed(const Duration(seconds: 120), () async {
        isGetData.value = true;
      });
    } else {}
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  //////////////////////////////#############################################################/////////////////////////
  /////////////////////////////////#############################################################/////////////////////////
  //////////////////////////////#############################################################/////////////////////////
  //////////////////////////////#############################################################/////////////////////////
  //////////////////////////////#############################################################/////////////////////////
  //////////////////////////////#############################################################/////////////////////////
  //////////////////////////////#############################################################/////////////////////////
  //////////////////////////////#############################################################/////////////////////////
  //////////////////////////////#############################################################/////////////////////////

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
          appServices.sharedPreferences.getDouble('Long') as double;

      displayLatLocation.value =
          appServices.sharedPreferences.getDouble('Lat') as double;

      getDataUser(displayUserPhone.value.toString());

      await Future.delayed(const Duration(seconds: 7), () async {
        if (appServices.sharedPreferences.containsKey('IsAddLocation')) {
          getDataUserLocation();
        } else {
          askPermissionOfLocation();
        }
      });
      addTokenUser();
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

  //////////////////////////////.................. ADD.The Orders.............................../////////////////////////
  var randomNumber = 0;

  RxBool MessageAddedIntoList = false.obs;

  addIntoOrder(String numberOrder, String total) async {
    waitAddOrder.value = true;
    initializeDateFormatting();
    Intl.defaultLocale = 'ar';
    DateTime now = DateTime.now();
    String format = 'hh:mm a';
    DateFormat formatter = DateFormat(format, 'ar');

    String arabicTime = formatter.format(now);

    ///////////////////////
    addOrder.value = true;
    var response = await crud.postRequest(AppLinksApi.addIntoOrder, {
      'user_id': displayUserId.value.toString(),
      'order_number': numberOrder.toString(),
      'total': total.toString(),
      'time_order_user': arabicTime.toString(),
      'date_order_user':
          "${DateFormat.MMM().format(DateTime.now()).toString()}-"
              "${DateFormat.d().format(DateTime.now()).toString()}",
    });

    if (response['status'] == "success") {
      Future.delayed(const Duration(seconds: 1), () async {
        fetchOrderCart(
          numberOrder.toString(),
        );
      });
      Future.delayed(const Duration(seconds: 3), () async {
        addOrder.value = false;
        countTheOrderStep.value = 2;
        showThePartOFOrder.value = true;
        messageCreateOrder.value = true;
        CelarRandomNumber();
        dataProductsListCart.clear();
        waitAddOrder.value = false;
      });
    } else {}
    return response;
  }

  var listOrderProductIdNew;
  addIntListProducts(String numberOrder, String total, String productId,
      String quantity) async {
    Random random = new Random();

    listOrderProductIdNew = random.nextInt(10000000);
    var response =
        await crud.postRequest(AppLinksApi.addIntoOrderListProducts, {
      'list_order_product_id': listOrderProductIdNew.toString(),
      'product_id': productId.toString(),
      'user_id': displayUserId.value.toString(),
      'total': total.toString(),
      'quan': quantity.toString(),
      'order_number': numberOrder.toString(),
    });

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  addIntListProductsEtr(
      String numberOrder, String productId, String extraId, String id) async {
    var response =
        await crud.postRequest(AppLinksApi.addIntoOrderListProductsExt, {
      'product_id': productId.toString(),
      'user_id': displayUserId.value.toString(),
      'order_number': numberOrder.toString(),
      'extra_id': extraId.toString(),
      'list_order_product_id': id.toString()
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
    appServices.sharedPreferences.remove('randomNumber');
  }

  GetgenerateRandomOrderNumberFromMemory() {
    if (appServices.sharedPreferences.containsKey('randomNumber')) {
      randomNumber =
          appServices.sharedPreferences.getInt('randomNumber') as int;
    } else {}
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

  //////////////////////////////.................. Get The Orders.............................../////////////////////////

////////////////////Get Products......................//////////

  RxBool showCart = false.obs;
/////////////////

  ////////////////////////

  RxBool isNotEmptyListOFProductsCart = false.obs;

  RxInt totalPrice = RxInt(0); // إضافة متغير جديد لحساب السعر الإجمالي
  var dataProductsListCart = <ListOfProductsCart>[].obs;
  Future<void> fetchProductsDataCart() async {
    var response = await http.post(Uri.parse(AppLinksApi.getListOfProducts),
        body: {'order_number': randomNumber.toString()});

    if (response.statusCode == 200) {
      List data = json.decode(response.body)["data"];

      dataProductsListCart.value = data
          .map<ListOfProductsCart>((e) => ListOfProductsCart.fromJson(e))
          .toList();

      totalPrice.value = dataProductsListCart.fold(
          0, (sum, item) => sum + (int.parse(item.total)));

      dataProductsListCart.length == 0
          ? isNotEmptyListOFProductsCart.value = false
          : isNotEmptyListOFProductsCart.value = true;
    } else {
      isNotEmptyListOFProductsCart.value = false;
      print("Error: ${response.statusCode}");
    }
  }

  ///////

  //////////////Ex List.........................////////

  RxBool isNotEmptyListOFProductsExtCart = false.obs;
  var dataProductsListExtCart = <ExtrasList>[].obs;
  Future fetchProductsExtDataCart(String id) async {
    var response = await http.post(Uri.parse(AppLinksApi.getListOfProductsExt),
        body: {'list_order_product_id': id.toString()});

    if (response.statusCode == 200) {
      var data = json.decode(response.body)["data"];

      dataProductsListExtCart =
          data.map<ExtrasList>((e) => ExtrasList.fromJson(e)).toList();

      dataProductsListExtCart.length == 0
          ? isNotEmptyListOFProductsExtCart.value = false
          : isNotEmptyListOFProductsExtCart.value = true;
    } else {
      isNotEmptyListOFProductsExtCart.value = false;
    }
  }

//////////////Order INListCart.........................////////

  RxInt orderNumberFromDataBase = 0.obs;
  RxInt totoalOrderPriceFromDatabase = 0.obs;
  RxString dateOfOrderFromDatabase = "".obs;
  RxString timeOFOrderFromDatabase = "".obs;
  RxBool isNotEmptyListOFOrderCart = false.obs;
  var dataOrderListCart = <ListOfOrder>[].obs;
  Future<void> fetchOrderCart(String OrderNumner) async {
    var response =
        await http.post(Uri.parse(AppLinksApi.getListOfOrderCart), body: {
      'user_id': displayUserId.value.toString(),
      'order_number': OrderNumner.toString()
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body)["data"];
      if (data != null) {
        dataOrderListCart.value =
            data.map<ListOfOrder>((e) => ListOfOrder.fromJson(e)).toList();

        dataOrderListCart.length == 0
            ? isNotEmptyListOFOrderCart.value = false
            : isNotEmptyListOFOrderCart.value = true;
      } else {
        isNotEmptyListOFOrderCart.value = false;
        print("Error: ${response.statusCode}");
      }
    }
  }
  ////////////////////////

///////////////////
  RxInt countTheOrderStep = 1.obs;

  RxBool addOrder = false.obs;

  RxBool showThePartOFCart = true.obs;
  RxBool showThePartOFOrder = false.obs;
  RxBool showThePartOfInTheWay = false.obs;
  RxBool showThePartOfClosedOrder = false.obs;

  /////////////////////////////////////////////////////////The OrderList/////////
//////////////Order List.........................////////
  RxBool showTheOrderList = false.obs;
  RxBool isNotEmptyListOFOrder = false.obs;
  var dataOrderList = <ListOfOrder>[].obs;
  Future<void> fetchOrder() async {
    var response = await http.post(Uri.parse(AppLinksApi.getListOfOrder),
        body: {'user_id': displayUserId.value.toString()});

    if (response.statusCode == 200) {
      var data = json.decode(response.body)["data"];
      //  if (data != null) {
      // هنا نضيف الشرط
      dataOrderList.value =
          data.map<ListOfOrder>((e) => ListOfOrder.fromJson(e)).toList();

      dataOrderList.length == 0
          ? isNotEmptyListOFOrder.value = false
          : isNotEmptyListOFOrder.value = true;
    } else {
      isNotEmptyListOFOrder.value = false;

      // }
    }
  }

  viewOrderList() {
    showTheOrderList.value = true;
    fetchOrder();
    fetchOffersOrders();
  }

  ////////////////////////////...........Token and Location.........................//////////////
  RxString token = "".obs;
  void addTokenUser() async {
    FirebaseMessaging.instance.getToken().then((value) async {
      token.value = value!;
      var response = await crud.postRequest(AppLinksApi.addTokenUser, {
        'token': token.value.toString(),
        'user_id': displayUserId.toString(),
      });

      return response;
    });
  }

  /////////////////////////////////////............... Location........................./////////////
  RxString address = "لايوجد عنوان".obs;

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

            savelocationUser(myCurrentPositionLatitude.toString(),
                myCurrentPositionLongitude.toString());
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

  Future<void> savelocationUser(
    String lat,
    String long,
  ) async {
    var response = await crud.postRequest(AppLinksApi.saveLocation, {
      'user_id': displayUserId.value.toString(),
      'user_latitude': lat.toString(),
      'user_longitude': long.toString(),
    });

    if (response['status'] == "success") {
      appServices.sharedPreferences.setDouble('Long', double.parse(long));
      appServices.sharedPreferences.setDouble('Lat', double.parse(lat));
      appServices.sharedPreferences.setInt('IsAddLocation', 1);
      getDataUserLocation();
    } else {}

    return response;
  }

  getDataUserLocation() async {
    var response = await crud.postRequest(AppLinksApi.getUserDataLocation, {
      'user_id': displayUserId.value.toString(),
    });

    if (response['status'] == "success") {
      displayLatLocation.value =
          double.parse(response['data'][0]['user_latitude'].toString());
      displayLongLocation.value =
          double.parse(response['data'][0]['user_longitude'].toString());
      appServices.sharedPreferences.setDouble('Long', displayLatLocation.value);
      appServices.sharedPreferences.setDouble('Lat', displayLongLocation.value);

      await Future.delayed(const Duration(seconds: 3), () async {
        ConvertIntoTextAddress();
        onInit();
      });
    } else {}
    return response;
  }

  ////////////Get Products.. By Searching...................///////////
  TextEditingController searchingControllr = TextEditingController();
  String searching = "";
  RxBool isSearching = false.obs;

  makeSearchingReady(String searching) {
    if (isSearching.value == true) {
      makeSearchingClear();
    } else {
      fetchProductsDataSearching(searching.toString());
      isSearching.value = true;
    }
  }

  makeSearchingClear() {
    searchingControllr.clear();
    searching = "";
    isSearching.value = false;
    isNotEmptyProducrsSearching.value = false;
    dataProductsListSearching.clear();
  }

  RxBool isNotEmptyProducrsSearching = false.obs;
  var dataProductsListSearching = <Products>[].obs;

  /////////////////////////////#######################..................... Products Details Searching .................../////////////
  RxBool showTheDetailsProductSearching = false.obs;
  RxInt indexTheProductsListSearching = 0.obs;
  goToDetailsProductsSearhcing(var index) {
    indexTheProductsListSearching.value = index;
    showTheDetailsProductSearching.value = true;
    PriceProducts.value = int.tryParse(dataProductsListByType[index].price)!;

    theTotalPrice.value = int.tryParse(dataProductsListSearching[index].price)!;
  }

  Future<void> fetchProductsDataSearching(String searching) async {
    var response =
        await http.post(Uri.parse(AppLinksApi.getProductsBySearching), body: {
      'search': searching.toString(),
    });

    if (response.statusCode == 200) {
      List data = json.decode(response.body)["data"];

      dataProductsListSearching.value =
          data.map((e) => Products.fromJson(e)).toList();

      dataProductsListSearching.length == 0
          ? isNotEmptyProducrsSearching.value = false
          : isNotEmptyProducrsSearching.value = true;
    } else {
      isNotEmptyProducrsSearching.value = false;
      print("Error: ${response.statusCode}");
    }
  }

  ///////////////////////..........Animtation Offers......................../////////////

//////////////////////////Delete Order Shopping Cart..................................../

  deleteFromShoppingCart(String idProductsShoppingCart) async {
    var response = await crud.postRequest(AppLinksApi.deleteFromItemsCart, {
      'user_id': displayUserId.value.toString(),
      'list_order_product_id': idProductsShoppingCart.toString(),
    });

    if (response['status'] == "success") {
      fetchProductsDataCart();
    } else {}
    return response;
  }

  deleteAllCart(String radnomNumber) async {
    var response = await crud.postRequest(AppLinksApi.deleteALLITMESCART, {
      'user_id': displayUserId.value.toString(),
      'order_number': radnomNumber.toString(),
    });

    if (response['status'] == "success") {
      showCart.value = false;
      totalPrice.value = 0;
      dataProductsListCart.clear();
      CelarRandomNumber();
    } else {}
    return response;
  }

  ///////////////////////...................Offers Orders............................///////////

  RxInt PriceOffers = 0.obs;
  RxInt theTotalPriceOffers = 0.obs;

  RxBool showOffersDetials = false.obs;
  RxBool messagesAboutOfersInOrder = false.obs;
  RxInt indexTheOfferssList = 0.obs;
  goToDetailsOfers(var index) {
    indexTheOfferssList.value = index;
    showOffersDetials.value = true;
    PriceOffers.value = int.tryParse(dataOffersList[index].price)!;
    theTotalPriceOffers.value = int.tryParse(dataOffersList[index].price)!;
  }

  //////////////////Add To Cart OR order.........................../////////

  RxInt TheNumberOfItmeOffers = 1.obs;

  AddTheItmeOffers() {
    TheNumberOfItmeOffers.value = TheNumberOfItmeOffers.value + 1;

    theTotalPriceOffers.value = PriceOffers.value * TheNumberOfItmeOffers.value;
  }

  MusnheItmeOffers() {
    if (TheNumberOfItme.value != 1) {
      TheNumberOfItme.value = TheNumberOfItmeOffers.value - 1;

      theTotalPriceOffers.value =
          PriceOffers.value * TheNumberOfItmeOffers.value;
    } else {}
  }

  //////////////Add Order IN Offers....................../
  addOffer(String idOffer, String total, String quantity) async {
    initializeDateFormatting();
    Intl.defaultLocale = 'ar';
    DateTime now = DateTime.now();
    String format = 'hh:mm a';
    DateFormat formatter = DateFormat(format, 'ar');

    String arabicTime = formatter.format(now);
    var response = await crud.postRequest(AppLinksApi.addOrderOffers, {
      'user_id': displayUserId.value.toString(),
      'offer_id': idOffer.toString(),
      'quantity': quantity.toString(),
      'total': total.toString(),
      'time_order_user': arabicTime.toString(),
      'date_order_user':
          "${DateFormat.MMM().format(DateTime.now()).toString()}-"
              "${DateFormat.d().format(DateTime.now()).toString()}",
    });

    if (response['status'] == "success") {
      messagesAboutOfersInOrder.value = true;
    } else {}
    return response;
  }

/////////////////////
  RxBool showDetailsOrderInOrderList = false.obs;
  RxInt indexTheOrder = 0.obs;
  goToDetailsOrder(var index) {
    indexTheOrder.value = index;
    showDetailsOrderInOrderList.value = true;
  }

  ////////////////////.....................................///////////

  RxBool whatisTheOrder = false.obs;

  RxBool isNotEmptyOffersOrders = false.obs;
  var dataListOffers = <ListOfOrderOffers>[].obs;

  Future<void> fetchOffersOrders() async {
    var response =
        await http.post(Uri.parse(AppLinksApi.getOrderOffers), body: {
      "user_id": displayUserId.value.toString(),
    });

    if (response.statusCode == 200) {
      List data = json.decode(response.body)["data"];

      dataListOffers.value =
          data.map((e) => ListOfOrderOffers.fromJson(e)).toList();

      dataListOffers.length == 0
          ? isNotEmptyOffersOrders.value = false
          : isNotEmptyOffersOrders.value = true;
    } else {
      isNotEmptyOffersOrders.value = false;
      print("Error: ${response.statusCode}");
    }
  }

  RxInt indexTheOrderOffers = 0.obs;
  RxBool showDetailsOrderInOrderListOffers = false.obs;

  goToDetailsOrderOffers(var index) {
    indexTheOrderOffers.value = index;
    showDetailsOrderInOrderListOffers.value = true;
  }

/////////////////..........Is Have Location - is Have Account...............//////////
  RxBool isNoAccount = false.obs;
  RxBool isNoLocation = false.obs;

  RxBool messageCreateOrder = false.obs;
  RxBool waitAddExtProducts = false.obs;
  RxBool waitAddOrder = false.obs;

  RxBool messagenoCart = false.obs;

  checkTheCartItems() {
    if (randomNumber == 0) {
      messagenoCart.value = true;
    }
  }

  ///////////// Internet............./////////
  var connectivityStatus = ''.obs;
  void checkConnectivity() async {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        connectivityStatus.value = 'لا يوجد اتصال بالإنترنت';
      } else {
        connectivityStatus.value = 'متصل بالإنترنت';
      }
    });
  }

  //////////////////////////////................... Offers...........................................//

  RxBool isLocationAcquired =
      false.obs; // إضافة متغير حالة لتتبع الحصول على الموقع

  Future getPo() async {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    if (services) {
      per = await Geolocator.checkPermission();
      if (per == LocationPermission.denied) {
        per = await Geolocator.requestPermission();
      }
      if (per == LocationPermission.whileInUse ||
          per == LocationPermission.always) {
        await Geolocator.getCurrentPosition().then((value) {
          myCurrentPositionLatitude = value.latitude;
          myCurrentPositionLongitude = value.longitude;
          isLocationAcquired.value = true; // تحديث الحالة بعد الحصول على الموقع
        });
      }
    }
  }

  var scrollController = ScrollController();
  void startAutoScroll() {
    const autoScrollDuration = Duration(seconds: 7);
    Timer.periodic(autoScrollDuration, (timer) {
      if (isLocationAcquired.value) {
        // التحقق من الحالة قبل التمرير
        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.position.pixels;
        final scrollAmount = 205.w; // حسب حجم العنصر الخاص بك

        if (currentScroll + scrollAmount >= maxScroll) {
          scrollController.animateTo(
            0.0,
            duration: Duration(seconds: 2),
            curve: Curves.easeOut,
          );
        } else {
          scrollController.animateTo(
            currentScroll + scrollAmount,
            duration: Duration(seconds: 2),
            curve: Curves.easeOut,
          );
        }
      } else {}
    });
  }

  /////////////////
}
