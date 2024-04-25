import '../../localization/changelanguage.dart';
import 'package:get/get.dart';

ChangeLanguageToLocale homeController = Get.put(ChangeLanguageToLocale());

class maintype {
  var id;
  var name;
  var img;

  maintype({required this.id, required this.name, required this.img});

  factory maintype.fromJson(Map<String, dynamic> json) {
    return maintype(
      id: json['type_id'] ?? 1,
      name: homeController.isChange.value == true
          ? json['type_name_ar']
          : json['type_name_en'] ?? 'Default Title',
      img: json['type_image'] ?? 'Default image',
    );
  }
}
