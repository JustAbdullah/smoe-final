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
      name: json['offer_name'] ?? 'Default Title',
      about: json['offer_about'] ?? 'Default about',
      img: json['offer_image'] ?? 'Default image',
      price: json['offer_price'] ?? 0,
    );
  }
}
