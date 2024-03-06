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
  ////////////////////// ADD Orders..............///////////////////////
  static const addIntoOrder = "${path}/create_order_s.php";
  static const addIntoOrderListProducts =
      "${path}/add_orders_products_list.php";
  static const addIntoOrderListProductsExt =
      "${path}/add_order_list_products_etras.php";

  ///////////////...................Get Orders................................////////

  static const getListOfProductsExt = "${path}/get_list_products_ext_s.php";
  static const getListOfProducts = "${path}/get_list_products_s.php";

  static const getListOfOrder = "${path}/get_orders_users_s.php";
  static const getListOfOrderCart = "${path}/get_order_user_with_cart_shop.php";

  static const addTokenUser = "${path}/add_token_user_s.php";

  static const getUserDataLocation = "${path}/get_data_user_s_location.php";
  static const saveLocation = "${path}/add_location_users_s.php";

///////////////////Get Products By Type..........///////

  static const getProductsByType = "${path}/get_products_by_types_s.php";
  static const getProductsBySearching =
      "https://larra.xyz/php_choc/searching_in_products_s.php";

  ///
}
