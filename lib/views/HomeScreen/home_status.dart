import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smoe_app_final/views/HomeScreen/home_screen.dart';

import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../core/constant/images_path.dart';
import '../../customWidgets/custom_text.dart';
import 'honeWidgets/top_header.dart';

class HomeStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder<bool>(
        future: checkInternetConnection(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('خطأ: ${snapshot.error}');
          } else {
            if (snapshot.data != null) {
              return snapshot.data!
                  ? HomeScreen()
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Stack(children: [
                        Positioned(
                          top: 0,
                          child: TopHeader(),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        Positioned(
                            top: 70.h,
                            left: 30.w,
                            right: 30.w,
                            child: Lottie.asset(ImagesPath.noInternet,
                                width: 160.w)),
                        Positioned(
                          top: 370.h,
                          left: 30.w,
                          right: 30.w,
                          child: TextCustom(
                              theText: "هنالك خطا في الاتصال بالانترنت".tr,
                              fontSizeWidth: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppTextStyles.Almarai,
                              fontColor: AppColors.balckColorTypeFour),
                        ),
                      ]),
                    );
            } else {
              return Text('لا يمكن التحقق من الاتصال بالإنترنت');
            }
          }
        },
      ),
    ));
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
