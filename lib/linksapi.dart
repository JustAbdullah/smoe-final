import 'dart:core';

class AppLinksApi {
  static const path = "https://larra.xyz/php_choc";
//////////////....................Display............../////////////
  static const TheOffersData = "${path}/get_offers_s.php";

  static const TheMainTypes = "${path}/get_main_type_s.php";
  static const TheProducts = "${path}/get_products_s.php";
  static const Getextras = "${path}/get_extras.php";
////////////...............Auth...................//////////////
  static const SignUp = "${path}/sign_up_s.php";

  static const getUserData = "${path}/get_data_user_s.php";
  ////////////////////// Orders..............///////////////////////
  static const addIntoOrder = "${path}/create_order_s.php";
  static const addIntoOrderListProducts =
      "${path}/add_orders_products_list.php";
  static const addIntoOrderListProductsExt =
      "${path}/add_order_list_products_etras.php";
}
