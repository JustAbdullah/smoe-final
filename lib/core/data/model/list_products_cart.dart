import 'list_products_extras_cart.dart';
import '../../localization/changelanguage.dart';
import 'package:get/get.dart';

ChangeLanguageToLocale homeController = Get.put(ChangeLanguageToLocale());

class ListOfProductsCart {
  var name;
  var img;
  var about;
  var price;
  var quan;
  var total;
  var list_order_product_id;
  List<ExtrasList> extras; // هنا نضيف الإضافات

  ListOfProductsCart({
    required this.name,
    required this.img,
    required this.about,
    required this.price,
    required this.quan,
    required this.total,
    required this.list_order_product_id,
    required this.extras, // وهنا
  });

  factory ListOfProductsCart.fromJson(Map<String, dynamic> json) {
    return ListOfProductsCart(
      name: homeController.isChange.value == true
          ? json['prooduct_name_ar']
          : json['prooduct_name_en'] ?? 'Default Title',
      img: json['products_image'] ?? 'Default image',
      about: homeController.isChange.value == true
          ? json['prooduct_description_ar']
          : json['prooduct_description_en'] ?? 'Default about',
      price: json['products_price'] ?? 00,
      quan: json['quan'] ?? 00,
      total: json['total'] ?? 00,
      list_order_product_id: json['list_order_product_id'] ?? 00,
      extras: [], // وهنا نضيف قائمة فارغة للإضافات
    );
  }
}
