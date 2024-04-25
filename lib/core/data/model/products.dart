import '../../localization/changelanguage.dart';
import 'package:get/get.dart';

ChangeLanguageToLocale homeController = Get.put(ChangeLanguageToLocale());

class Products {
  var id;
  var name;
  var img;
  var about;
  var price;

  Products(
      {required this.id,
      required this.name,
      required this.img,
      required this.about,
      required this.price});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['prooduct_id'] ?? 0,
      name: homeController.isChange.value == true
          ? json['prooduct_name_ar']
          : json['prooduct_name_en'] ?? 'Default Title',
      img: json['products_image'] ?? 'Default image',
      about: homeController.isChange.value == true
          ? json['prooduct_description_ar']
          : json['prooduct_description_en'] ?? 'Default about',
      price: json['products_price'] ?? 00,
    );
  }
}
