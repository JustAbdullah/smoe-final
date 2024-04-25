import '../../localization/changelanguage.dart';
import 'package:get/get.dart';

ChangeLanguageToLocale homeController = Get.put(ChangeLanguageToLocale());

class ExtrasList {
  var id;
  var idProduct;
  var name;
  var price;
  var idEx;
  var id_order_extras;

  ExtrasList(
      {required this.id,
      required this.idProduct,
      required this.name,
      required this.price,
      required this.idEx,
      required this.id_order_extras});

  factory ExtrasList.fromJson(Map<String, dynamic> json) {
    return ExtrasList(
      id: json['extras_products_id'] ?? 0,
      name: homeController.isChange.value == true
          ? json['extra_name_ar']
          : json['extra_name_en'] ?? 'Default Title',
      idProduct: json['products_id'] ?? 'D',
      idEx: json['extra_id'] ?? 0,
      price: json['extra_price'] ?? 0,
      id_order_extras: json['id_order_extras'] ?? 0,
    );
  }
}
