import '../../localization/changelanguage.dart';
import 'package:get/get.dart';

ChangeLanguageToLocale homeController = Get.put(ChangeLanguageToLocale());

class offers {
  var id;
  var name;
  var about;
  var price;
  var img;

  offers(
      {required this.id,
      required this.name,
      required this.about,
      required this.price,
      required this.img});

  factory offers.fromJson(Map<String, dynamic> json) {
    return offers(
      id: json['offer_id'] ?? 0,
      name: homeController.isChange.value == true
          ? json['offer_name']
          : json['offer_name_en'] ?? 'Default Title',
      about: homeController.isChange.value == true
          ? json['offer_about']
          : json['offer_about_en'] ?? 'Default about',
      img: json['offer_image'] ?? 'Default image',
      price: json['offer_price'] ?? 0,
    );
  }
}
