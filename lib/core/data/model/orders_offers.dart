class ListOfOrderOffers {
  var order_id;
  var offer_id;
  var total;
  var order_status;
  var time_order_user;
  var date_order_user;
  var quantity;

  ListOfOrderOffers({
    required this.order_id,
    required this.offer_id,
    required this.total,
    required this.order_status,
    required this.time_order_user,
    required this.date_order_user,
    required this.quantity,
  });

  factory ListOfOrderOffers.fromJson(Map<String, dynamic> json) {
    return ListOfOrderOffers(
        order_id: json['order_id'] ?? 0,
        offer_id: json['offer_id'] ?? 0,
        total: json['total'] ?? 0,
        quantity: json['quantity'] ?? 0,
        order_status: json['order_status'] ?? 2,
        time_order_user: json['time_order_user'] ?? '',
        date_order_user: json['date_order_user'] ?? '');
  }
}
