class ListOfOrder {
  var order_id;
  var order_number;
  var total;
  var order_status;
  var time_order_user;
  var date_order_user;

  ListOfOrder({
    required this.order_id,
    required this.order_number,
    required this.total,
    required this.order_status,
    required this.time_order_user,
    required this.date_order_user,
  });

  factory ListOfOrder.fromJson(Map<String, dynamic> json) {
    return ListOfOrder(
        order_id: json['order_id'] ?? 0,
        order_number: json['order_number'] ?? 0,
        total: json['total'] ?? 0,
        order_status: json['order_status'] ?? 2,
        time_order_user: json['time_order_user'] ?? '',
        date_order_user: json['date_order_user'] ?? '');
  }
}
