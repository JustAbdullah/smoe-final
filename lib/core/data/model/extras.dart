class Extras {
  var id;
  var idProduct;
  var name;
  var price;
  var idEx;

  Extras(
      {required this.id,
      required this.idProduct,
      required this.name,
      required this.price,
      required this.idEx});

  factory Extras.fromJson(Map<String, dynamic> json) {
    return Extras(
      id: json['extras_products_id'] ?? 0,
      name: json['extra_name_ar'] ?? 'Default Title',
      idProduct: json['products_id'] ?? 'D',
      idEx: json['extra_id'] ?? 0,
      price: json['extra_price'] ?? 0,
    );
  }
}
