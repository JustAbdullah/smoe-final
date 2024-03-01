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
      name: json['prooduct_name_ar'] ?? 'Default Title',
      img: json['products_image'] ?? 'Default image',
      about: json['prooduct_description_ar'] ?? 'Default about',
      price: json['products_price'] ?? 00,
    );
  }
}
