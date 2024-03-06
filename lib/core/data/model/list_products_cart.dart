import 'package:get/get.dart';

import 'list_products_extras_cart.dart';

class ListOfProductsCart {
  var name;
  var img;
  var about;
  var price;
  var quan;
  var total;
  var list_order_product_id;
  var extras = <ExtrasList>[].obs; // هنا تمت إضافة القائمة الجديدة

  ListOfProductsCart({
    required this.name,
    required this.img,
    required this.about,
    required this.price,
    required this.quan,
    required this.total,
    required this.list_order_product_id,
  });

  factory ListOfProductsCart.fromJson(Map<String, dynamic> json) {
    return ListOfProductsCart(
      name: json['prooduct_name_ar'] ?? 'Default Title',
      img: json['products_image'] ?? 'Default image',
      about: json['prooduct_description_ar'] ?? 'Default about',
      price: json['products_price'] ?? 00,
      quan: json['quan'] ?? 00,
      total: json['total'] ?? 00,
      list_order_product_id: json['list_order_product_id'] ?? 00,
    );
  }
}
