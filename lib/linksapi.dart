import 'dart:core';

class AppLinksApi {
  static const path = "https://larra.xyz/php_choc";
//////////////....................Display............../////////////

  static const TheOffersData = "${path}/get_offers_s.php";

  ///Add Convert To Larval///
  static const TheMainTypes = "${path}/get_main_type_s.php";

  ///Add Convert To Larval///
  static const TheProducts = "${path}/get_products_s.php";

  ///Add Convert To Larval///
  static const Getextras = "${path}/get_extras.php";

  ///Add Convert To Larval///
////////////...............Auth...................//////////////

  static const SignUp = "${path}/sign_up_s.php";

  ///Add Convert To Larval///
  static const login = "${path}/login_s.php";

  ///Add Convert To Larval///
  static const getUserData = "${path}/get_data_user_s.php";

  ///Add Convert To Larval///
  ////////////////////// ADD Orders..............///////////////////////
  static const addIntoOrder = "${path}/create_order_s.php";

  ///Add Convert To Larval///
  static const addIntoOrderListProducts =
      "${path}/add_orders_products_list.php";

  ///Add Convert To Larval///
  static const addIntoOrderListProductsExt =
      "${path}/add_order_list_products_etras.php";

  ///Add Convert To Larval///
  ///////////////...................Get Orders................................////////

  static const getListOfProductsExt = "${path}/get_list_products_ext_s.php";

  ///Add Convert To Larval///
  static const getListOfProducts = "${path}/get_list_products_s.php";

  ///Add Convert To Larval///
  static const getListOfOrder = "${path}/get_orders_users_s.php";

  ///Add Convert To Larval///
  static const getListOfOrderCart = "${path}/get_order_user_with_cart_shop.php";

  ///Add Convert To Larval///
////////////////////////
  static const addTokenUser = "${path}/add_token_user_s.php";

  ///Add Convert To Larval ///

  static const getUserDataLocation = "${path}/get_data_user_s_location.php";

  ///Add Convert To Larval ///
  static const saveLocation = "${path}/add_location_users_s.php";

///////////////////Get Products By Type..........///////

  static const getProductsByType = "${path}/get_products_by_types_s.php";

  ///Add Convert To Larval ///
  static const getProductsBySearching = "${path}/searching_in_products_s.php";

  ///Add Convert To Larval ///

  ////////////////////////////Delete Shopping Cart.........................../////////

  static const deleteFromItemsCart = "${path}/delete_item_from_order.php";

  ///Add Convert To Larval ///

  static const deleteALLITMESCART = "${path}/delete_shopping_order_s.php";

  ///Add Convert To Larval ///

////////////////////////////

  static const addOrderOffers = "${path}/create_order_offers_s.php";
  static const getOrderOffers = "${path}/get_offers_s_orders.php";

  ///
}
